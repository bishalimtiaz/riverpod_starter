import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/services/app_service.dart';
import 'package:riverpod_starter/app/data/model/response_model/github_project_search_response.dart';
import 'package:riverpod_starter/app/data/repository/github_repository.dart';
import 'package:riverpod_starter/app/modules/home/ui_model/github_project_ui_model.dart';
import 'package:riverpod_starter/app/modules/project_details/models/project_details_arg.dart';
import '/app/core/base/base_controller.dart';

class ProjectDetailsController extends BaseController {
  final GithubRepository repository;

  late final ProjectDetailsArg? argument;
  final GithubProjectUiModel githubProjectUiModel = GithubProjectUiModel();

  ProjectDetailsController({
    required Ref<ChangeNotifier> ref,
    required this.repository,
  }) : super(ref: ref);

  void getGithubRepository(userName, repositoryName) {
    callDataService(
      repository.getProject(userName, repositoryName),
      onSuccess: _handleProjectDetailsResponseSuccess,
    );
  }

  void _handleProjectDetailsResponseSuccess(Item project) {

    githubProjectUiModel.copyWith(
      repositoryName: project.name != null ? project.name! : "",
      ownerLoginName: project.owner != null ? project.owner!.login! : "",
      ownerAvatar: project.owner != null ? project.owner!.avatarUrl! : "",
      numberOfStar: project.stargazersCount ?? 0,
      numberOfFork: project.forks ?? 0,
      score: project.score ?? 0.0,
      watchers: project.watchers ?? 0,
      description: project.description ?? "",
    );

    notifyListeners();
  }

  @override
  void onInit() {
    /// argument is not recommended to use. arguments may not fit if you target web app.
    /// Because browser back button, browser refresh, deep linking can't pass argument and ypu will get this argument null
    /// prefer using queryParams instead.
    argument = AppService.argument as ProjectDetailsArg?;
    if(argument != null){
      getGithubRepository(argument!.userName, argument!.repoName);
    } else{
      showErrorMessage("Something Went Wrong");
    }
    super.onInit();
  }
}
