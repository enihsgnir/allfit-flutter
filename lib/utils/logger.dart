import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 5,
    lineLength: 90,
    printTime: true,
  ),
);
