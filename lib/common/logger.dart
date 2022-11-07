import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      printTime: false,
      excludeBox: {
        Level.verbose: true,
        Level.debug: true,
        Level.info: true,
      }),
  output: _ConsoleOutput(),
);

class _ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      // ignore: avoid_print
      print("LOGGER - $line");
    }
  }
}
