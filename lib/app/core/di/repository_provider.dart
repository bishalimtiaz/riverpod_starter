import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/app/data/data_source/remote_data_source_impl/github_remote_data_source_impl.dart';
import '/app/data/repository/github_repository.dart';
import '/app/data/repository_impl/github_repository_impl.dart';

final githubRepositoryProvider = Provider.autoDispose<GithubRepository>(
  (ref) => GithubRepositoryImpl(
    remoteSource: GithubRemoteDataSourceImpl(),
  ),
);
