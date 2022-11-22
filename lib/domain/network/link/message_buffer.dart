import 'dart:collection';
import 'dart:typed_data';

class MessageHeader {
  static const length = 4;

  static Uint8List encode(int messageLength) {
    return Uint8List(length)
      ..buffer.asByteData().setInt32(0, messageLength, Endian.big);
  }

  static int decode(Uint8List header) {
    return header.buffer.asByteData().getInt32(0, Endian.big);
  }
}

class MessageBuffer {
  final BytesBuilder _bytes = BytesBuilder();
  int? _nextMessageLength;
  final Queue<Uint8List> _messages = Queue();

  MessageBuffer();

  add(Uint8List newBytes) {
    _bytes.add(newBytes);
    if (_nextMessageLength == null && _bytes.length >= MessageHeader.length) {
      _retrieveHeader();
    }
    if (_nextMessageLength != null && _bytes.length >= _nextMessageLength!) {
      _retrieveMessage();
    }
  }

  _retrieveHeader() {
    final retrievedBytes = _bytes.takeBytes();
    final headerBytes = retrievedBytes.sublist(0, MessageHeader.length);
    if (retrievedBytes.length > MessageHeader.length) {
      _bytes.add(retrievedBytes.sublist(MessageHeader.length));
    }
    _nextMessageLength = MessageHeader.decode(headerBytes);
  }

  _retrieveMessage() {
    final length = _nextMessageLength!;
    final retrievedBytes = _bytes.takeBytes();
    final messageBytes = retrievedBytes.sublist(0, length);
    _messages.add(messageBytes);
    _nextMessageLength = null;
    if (retrievedBytes.length > length) {
      add(retrievedBytes.sublist(length));
    }
  }

  Uint8List? next() {
    return _messages.isNotEmpty ? _messages.removeFirst() : null;
  }
}
