import 'package:go_router/go_router.dart';
import '/app/routes/app_routes.dart';
import '/app/modules/landing/views/landing_view.dart';
import '/app/modules/project_details/views/project_details_view.dart';

class AppPages {
  AppPages._();

  static final router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: Paths.LANDING,
    urlPathStrategy: UrlPathStrategy.path,
    routes: <GoRoute>[
      GoRoute(
          name: Routes.LANDING,
          path: Paths.LANDING,
          builder: (context, state) => LandingView()),
      GoRoute(
          name: Routes.PROJECT_DETAILS,
          path: Paths.PROJECT_DETAILS,
          builder: (context, state) => ProjectDetailsView()),
    ],
  );
}
