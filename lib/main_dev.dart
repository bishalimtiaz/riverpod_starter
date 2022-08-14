import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/utils/provider_logger.dart';

import '/app/my_app.dart';
import '/flavors/build_config.dart';
import '/flavors/env_config.dart';
import '/flavors/environment.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "Flutter GetX Template Dev",
    baseUrl: "https://api.github.com",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const MyApp(),
    ),
  );
}
