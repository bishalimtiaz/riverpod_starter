import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/base/paging_controller.dart';
import 'package:riverpod_starter/app/core/di/repository_provider.dart';
import 'package:riverpod_starter/app/modules/favourite/controllers/favourite_controller.dart';
import 'package:riverpod_starter/app/modules/home/controllers/home_controller.dart';
import 'package:riverpod_starter/app/modules/home/ui_model/github_project_ui_model.dart';
import 'package:riverpod_starter/app/modules/landing/controllers/landing_controller.dart';
import 'package:riverpod_starter/app/modules/other/controllers/other_controller.dart';
import 'package:riverpod_starter/app/modules/settings/controllers/settings_controller.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>(
  (ref) => HomeController(
    repository: ref.read(githubRepositoryProvider),
    pagingControllerProvider: githubProjectListPagingControllerProvider,
    ref: ref,
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

final githubProjectListPagingControllerProvider = ChangeNotifierProvider<PagingController<GithubProjectUiModel>>(
      (ref) => PagingController<GithubProjectUiModel>(),
);
