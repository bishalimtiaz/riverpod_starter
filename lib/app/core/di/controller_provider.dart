import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/di/repository_provider.dart';
import '/app/modules/favourite/controllers/favourite_controller.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/modules/home/ui_model/github_project_ui_model.dart';
import '/app/modules/landing/controllers/landing_controller.dart';
import '/app/modules/other/controllers/other_controller.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>(
  (ref) => HomeController(
    repository: ref.read(githubRepositoryProvider),
    pagingControllerProvider: githubProjectListPagingControllerProvider,
    ref: ref,
  ),
);

final landingControllerProvider = ChangeNotifierProvider<LandingController>(
  (ref) => LandingController(ref: ref),
);

final otherControllerProvider = ChangeNotifierProvider<OtherController>(
  (ref) => OtherController(ref: ref),
);

final settingsControllerProvider = ChangeNotifierProvider<SettingsController>(
  (ref) => SettingsController(ref: ref),
);

final favouriteControllerProvider = ChangeNotifierProvider<FavouriteController>(
  (ref) => FavouriteController(ref: ref),
);

final githubProjectListPagingControllerProvider = ChangeNotifierProvider<PagingController<GithubProjectUiModel>>(
      (ref) => PagingController<GithubProjectUiModel>(),
);
