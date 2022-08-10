import 'package:dio/dio.dart';
import '/app/data/local/preference/preference_manager.dart';

class RequestHeaderInterceptor extends InterceptorsWrapper {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getCustomHeaders().then((customHeaders) {
      options.headers.addAll(customHeaders);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
    await PreferenceManager.getString(PreferenceManager.keyToken);
    var customHeaders = {'content-type': 'application/json'};
    if(accessToken.isNotEmpty) customHeaders.addAll({"Authorization": "Token $accessToken"});

    return customHeaders;
  }
}
