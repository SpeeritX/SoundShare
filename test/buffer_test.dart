import 'dart:convert';
import 'dart:typed_data';

import 'package:sound_share/network/link/message_buffer.dart';
import 'package:test/test.dart';

void main() {
  test('Add header and message separately', () {
    final buffer = MessageBuffer();
    const message = "Hello World!";
    final messageBytes = Uint8List.fromList(utf8.encode(message));
    final headerBytes = MessageHeader.encode(messageBytes.length);
    expect(buffer.next(), null);
    buffer.add(headerBytes);
    expect(buffer.next(), null);
    buffer.add(messageBytes);
    final receivedMessage = buffer.next();
    expect(receivedMessage, isNot(equals(null)));
    final decodedMessage = utf8.decode(receivedMessage!);
    expect(decodedMessage, message);
    expect(buffer.next(), null);
  });
  test('Add header and message together', () {
    final buffer = MessageBuffer();
    const message = "Hello World!";
    final messageBytes = Uint8List.fromList(utf8.encode(message));
    final headerBytes = MessageHeader.encode(messageBytes.length);
    final allBytes = Uint8List.fromList([...headerBytes, ...messageBytes]);
    buffer.add(allBytes);
    final receivedMessage = buffer.next();
    expect(receivedMessage, isNot(equals(null)));
    final decodedMessage = utf8.decode(receivedMessage!);
    expect(decodedMessage, message);
    expect(buffer.next(), null);
  });
  test('Add each byte separately', () {
    final buffer = MessageBuffer();
    const message = "Hello Worldńą!";
    final messageBytes = Uint8List.fromList(utf8.encode(message));
    final headerBytes = MessageHeader.encode(messageBytes.length);
    final allBytes = Uint8List.fromList([...headerBytes, ...messageBytes]);
    for (final byte in allBytes) {
      buffer.add(Uint8List.fromList([byte]));
    }
    final receivedMessage = buffer.next();
    expect(receivedMessage, isNot(equals(null)));
    final decodedMessage = utf8.decode(receivedMessage!);
    expect(decodedMessage, message);
    expect(buffer.next(), null);
  });
  test('Add two messages', () {
    final buffer = MessageBuffer();
    // The first message
    const message = "Hello World!";
    final messageBytes = Uint8List.fromList(utf8.encode(message));
    final headerBytes = MessageHeader.encode(messageBytes.length);
    // The second message
    const message2 = "Second message test.";
    final headerBytes2 = MessageHeader.encode(message2.length);
    final messageBytes2 = Uint8List.fromList(utf8.encode(message2));
    // Handle combined messages byte by byte
    final allBytes = Uint8List.fromList(
        [...headerBytes, ...messageBytes, ...headerBytes2, ...messageBytes2]);
    for (final byte in allBytes) {
      buffer.add(Uint8List.fromList([byte]));
    }
    // Check the first message
    final receivedMessage = buffer.next();
    expect(receivedMessage, isNot(equals(null)));
    final decodedMessage = utf8.decode(receivedMessage!);
    expect(decodedMessage, message);
    // Check the second message
    final receivedMessage2 = buffer.next();
    expect(receivedMessage2, isNot(equals(null)));
    final decodedMessage2 = utf8.decode(receivedMessage2!);
    expect(decodedMessage2, message2);
    expect(buffer.next(), null);
  });
}
