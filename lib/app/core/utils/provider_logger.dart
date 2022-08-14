import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import '/flavors/build_config.dart';

class ProviderLogger extends ProviderObserver {
  final Logger logger = BuildConfig.instance.config.logger;

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.i(
      "provider_updated: provider -> ${provider.name ?? provider.runtimeType} newValue -> $newValue previousValue -> $previousValue",
    );
  }

  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    logger.i(
      "provider_added: provider -> ${provider.name ?? provider.runtimeType} value -> $value",
    );

    super.didAddProvider(provider, value, container);
  }

  @override
  void providerDidFail(ProviderBase provider, Object error,
      StackTrace stackTrace, ProviderContainer container) {
    logger.i(
        "provider_failed: provider -> ${provider.name ?? provider.runtimeType} error -> $error stackTrace -> $stackTrace");
    super.providerDidFail(provider, error, stackTrace, container);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.i(
        "provider_disposed: provider -> ${provider.name ?? provider.runtimeType}");
    super.didDisposeProvider(provider, container);
  }
}
