import '/app/core/base/base_controller.dart';
import '/app/core/base/base_repository.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/modules/home/ui_model/github_project_ui_model.dart';

class HomeController extends BaseController {
  HomeController({required BaseRepository repository})
      : super(repository: repository);

  final List<GithubProjectUiModel> githubProjectList = [];

  void _getGithubGetxProjects() {
    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'flutter getx template',
      pageNumber: pagingController.pageNumber,
    );
    var githubRepoSearchService = repository.searchProject(queryParam);
    logger.d("paging_debug: isInitialLoad: ${pagingController.isInitialLoad}");

    callDataService(
      githubRepoSearchService,
      onStart: pagingController.isInitialLoad ? null : () {}, //ignore: no-empty-block
      onSuccess: _handleProjectListResponseSuccess,
    );
  }

  var pagingController = PagingController<GithubProjectUiModel>();

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

    pagingController.appendData(repoList ?? []);
    githubProjectList.clear();
    githubProjectList.addAll(pagingController.listItems);
    notifyListeners();
  }

  void onRefreshPage() {
    _getGithubGetxProjects();
  }

  void onLoadNextPage() {
    notifyListeners();
    _getGithubGetxProjects();
  }

  @override
  void onInit() {
    _getGithubGetxProjects();
    super.onInit();
  }
}
