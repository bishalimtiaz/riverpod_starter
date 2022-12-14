import '/app/data/model/query_model/github_search_query_param.dart';
import '/app/data/model/response_model/github_project_search_response.dart';

abstract class GithubRemoteDataSource {
  Future<GithubProjectSearchResponse> searchGithubProject(
      GithubSearchQueryParam queryParam);

  Future<Item> getGithubProjectDetails(String userName, String repositoryName);
}
