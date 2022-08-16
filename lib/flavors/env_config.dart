import 'package:logger/logger.dart';

import '/app/core/values/app_values.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final bool shouldCollectCrashLog;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    this.shouldCollectCrashLog = false,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        /// Number of method calls to be displayed
        methodCount: AppValues.loggerMethodCount,

        /// Number of method calls if stacktrace is provided
        errorMethodCount: AppValues.loggerErrorMethodCount,

        /// Width of the output
        lineLength: AppValues.loggerLineLength,

        /// Colorful log messages
        colors: true,

        /// Print an emoji for each log message
        printEmojis: true,

        /// Should each log print contain a timestamp
        printTime: false,
      ),
    );
  }
}
