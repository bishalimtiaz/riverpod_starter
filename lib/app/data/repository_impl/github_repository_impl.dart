import 'package:riverpod_starter/app/core/base/base_remote_source.dart';
import 'package:riverpod_starter/app/core/base/base_repository.dart';

import '/app/core/model/github_search_query_param.dart';
import '/app/data/model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';

class GithubRepositoryImpl extends BaseRepository implements GithubRepository {
  GithubRepositoryImpl({
    required BaseRemoteSource remoteSource,
  }) : super(remoteSource: remoteSource);

  @override
  Future<GithubProjectSearchResponse> searchProject(
      GithubSearchQueryParam queryParam) {
    return remoteSource.searchGithubProject(queryParam);
  }

  @override
  Future<Item> getProject(String userName, String repositoryName) {
    return remoteSource.getGithubProjectDetails(userName, repositoryName);
  }
}
