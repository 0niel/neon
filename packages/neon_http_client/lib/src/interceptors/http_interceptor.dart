import 'dart:async';

import 'package:http/http.dart' as http;

/// Interceptor that can manipulate http requests and responses.
abstract interface class HttpInterceptor {
  /// Whether this interceptor should intercept requests.
  bool shouldInterceptRequest(http.BaseRequest request);

  /// Intercepts the given [request].
  ///
  /// Provided requests are not finalized yet. It is an error for an interceptor
  /// to finalize it by executing them.
  FutureOr<http.BaseRequest> interceptRequest({required http.BaseRequest request});

  /// Whether this interceptor should intercept response.
  bool shouldInterceptResponse(http.StreamedResponse response);

  /// Intercepts the given [response].
  ///
  /// Until package:http 2.0 makes [http.BaseResponseWithUrl] mandatory the request url is used.
  FutureOr<http.StreamedResponse> interceptResponse({
    required http.StreamedResponse response,
    required Uri url,
  });
}
