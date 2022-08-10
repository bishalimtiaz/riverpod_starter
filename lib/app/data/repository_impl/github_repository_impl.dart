
import 'package:riverpod_starter/app/data/data_source/remote_data_source/github_remote_data_source.dart';

import '../model/query_model/github_search_query_param.dart';
import '../model/response_model/github_project_search_response.dart';
import '/app/data/repository/github_repository.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDataSource remoteSource;

  GithubRepositoryImpl({
    required this.remoteSource,
  });

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
