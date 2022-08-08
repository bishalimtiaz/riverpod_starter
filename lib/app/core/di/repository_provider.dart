import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_starter/app/core/base/base_repository.dart';
import 'package:riverpod_starter/app/data/data_source/remote_data_source_impl/github_remote_data_source_impl.dart';
import 'package:riverpod_starter/app/data/repository_impl/github_repository_impl.dart';

final githubRepositoryProvider = Provider<BaseRepository>(
  (ref) => GithubRepositoryImpl(
    remoteSource: GithubRemoteDataSourceImpl(),
  ),
);
