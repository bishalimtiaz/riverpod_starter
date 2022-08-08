import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/di/repository_provider.dart';
import 'package:riverpod_starter/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:riverpod_starter/app/modules/home/controllers/home_controller.dart';
import 'package:riverpod_starter/app/modules/landing/controllers/landing_controller.dart';
import 'package:riverpod_starter/app/modules/other/controllers/other_controller.dart';
import 'package:riverpod_starter/app/modules/settings/controllers/settings_controller.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>(
  (ref) => HomeController(
    repository: ref.read(githubRepositoryProvider),
  ),
);

final landingControllerProvider = ChangeNotifierProvider<LandingController>(
  (ref) => LandingController(),
);

final otherControllerProvider = ChangeNotifierProvider<OtherController>(
  (ref) => OtherController(),
);

final settingsControllerProvider = ChangeNotifierProvider<SettingsController>(
  (ref) => SettingsController(),
);

final favouriteControllerProvider = ChangeNotifierProvider<FavouriteController>(
  (ref) => FavouriteController(),
);
