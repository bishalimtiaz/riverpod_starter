import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/base_repository.dart';
import '/app/core/base/paging_controller.dart';
import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/modules/home/ui_model/github_project_ui_model.dart';

class HomeController extends BaseController {
  final ChangeNotifierProvider<PagingController<GithubProjectUiModel>> pagingControllerProvider;
  final ChangeNotifierProviderRef  ref;

  HomeController({
    required BaseRepository repository,
    required this.pagingControllerProvider,
    required this.ref,
  }) : super(repository: repository);

  final List<GithubProjectUiModel> githubProjectList = [];

  void _getGithubGetxProjects() {
    var queryParam = GithubSearchQueryParam(
      searchKeyWord: 'flutter getx template',
      pageNumber: ref.read(pagingControllerProvider).pageNumber,
    );
    var githubRepoSearchService = repository.searchProject(queryParam);
    //logger.d("paging_debug: isInitialLoad: ${pagingController.isInitialLoad}");

    callDataService(
      githubRepoSearchService,
      onStart: ref.read(pagingControllerProvider).isInitialLoad ? null : () {},
      //ignore: no-empty-block
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

    ref.read(pagingControllerProvider).appendData(repoList ?? []);
    githubProjectList.clear();
    githubProjectList.addAll(ref.read(pagingControllerProvider).listItems);
    notifyListeners();
  }

  void onRefreshPage() {
    _getGithubGetxProjects();
  }

  void onLoadNextPage() {
    _getGithubGetxProjects();
  }

  @override
  void onInit() {
    _getGithubGetxProjects();
    super.onInit();
  }

  @override
  void onDispose() {
    ref.invalidateSelf();
    super.onDispose();
  }
}
