class GithubProjectUiModel {
  String repositoryName;
  String ownerLoginName;
  String ownerAvatar;
  int numberOfStar;
  int numberOfFork;
  String description;
  double score;
  int watchers;

  GithubProjectUiModel({
    this.repositoryName = "",
    this.ownerLoginName = "",
    this.ownerAvatar = "",
    this.numberOfStar = 0,
    this.numberOfFork = 0,
    this.description = "",
    this.score = 0.0,
    this.watchers = 0,
  });

  GithubProjectUiModel copyWith({
    required String repositoryName,
    required String ownerLoginName,
    required String ownerAvatar,
    required int numberOfStar,
    required int numberOfFork,
    required String description,
    required double score,
    required int watchers,
  }) {

    this.repositoryName = repositoryName;
    this.ownerLoginName = ownerLoginName;
    this.ownerAvatar = ownerAvatar;
    this.numberOfStar = numberOfStar;
    this.numberOfFork = numberOfFork;
    this.description = description;
    this.score = score;
    this.watchers = watchers;

    return this;
  }
}
