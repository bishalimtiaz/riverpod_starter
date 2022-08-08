import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/di/repository_provider.dart';
import 'package:riverpod_starter/app/modules/home/controllers/home_controller.dart';

final homeControllerProvider = ChangeNotifierProvider<HomeController>(
  (ref) => HomeController(
    repository: ref.read(githubRepositoryProvider),
  ),
);
