

///We don't want to initialize this class that's why we made it abstract
class BaseRepository {
  final dynamic remoteSource;

  BaseRepository({required this.remoteSource});
}
