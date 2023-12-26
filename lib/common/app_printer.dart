import 'package:logger/logger.dart';
import 'dart:io' as io;

class AppLogPrinter extends LogPrinter {
  final prettyPrinter = PrettyPrinter(
    colors: io.stdout.supportsAnsiEscapes,
    methodCount: 0,
  );

  @override
  List<String> log(LogEvent event) {
    if (event.level == Level.error) {}

    return prettyPrinter.log(event);
  }
}
