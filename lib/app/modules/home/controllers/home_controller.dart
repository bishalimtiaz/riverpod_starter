import 'package:riverpod_starter/app/core/base/base_controller.dart';
import 'package:riverpod_starter/app/core/base/base_repository.dart';
import 'package:riverpod_starter/app/core/model/github_search_query_param.dart';
import 'package:riverpod_starter/app/data/model/github_project_search_response.dart';
import 'package:riverpod_starter/app/modules/home/ui_model/github_project_ui_model.dart';

class HomeController extends BaseController {
  HomeController({required BaseRepository repository})
      : super(repository: repository);

  final List<GithubProjectUiModel> githubProjectList = [];

  void _getGithubGetxProjects() {
    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'flutter getx template',
      pageNumber: 1,
    );
    var githubRepoSearchService = repository.searchProject(queryParam);

    callDataService(
      githubRepoSearchService,
      onSuccess: _handleProjectListResponseSuccess,
    );
  }

  void _handleProjectListResponseSuccess(GithubProjectSearchResponse response) {
    List<GithubProjectUiModel>? repoList = response.items
        ?.map((e) => GithubProjectUiModel(
              repositoryName: e.name != null ? e.name! : "Null",
              ownerLoginName: e.owner != null ? e.owner!.login! : "Null",
              ownerAvatar: e.owner != null ? e.owner!.avatarUrl! : "",
              numberOfStar: e.stargazersCount ?? 0,
              numberOfFork: e.forks ?? 0,
              score: e.score ?? 0.0,
              watchers: e.watchers ?? 0,
              description: e.description ?? "",
            ))
        .toList();

    githubProjectList.addAll(repoList ?? []);
    notifyListeners();
  }

  @override
  void onInit() {
    _getGithubGetxProjects();
    super.onInit();
  }
}
