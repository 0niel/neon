import 'package:cookie_jar/cookie_jar.dart' as cookie_jar;
import 'package:dynamite_runtime/http_client.dart';
import 'package:http/http.dart' as http;
import 'package:nextcloud/src/utils/cookie_jar_client.dart';
import 'package:universal_io/io.dart';

/// A client configuring the clients for all Nextcloud APIs.
///
/// To access the APIs of a particular app import the extensions through `package:nextcloud/{id}.dart`.
class NextcloudClient extends DynamiteClient with http.BaseClient {
  /// Creates a new Nextcloud API client.
  ///
  /// [baseURL] has to point to the Nextcloud server webroot.
  ///
  /// To access authenticated endpoints [loginName] and one of [password] or [appPassword] have to be set.
  /// Note that not all endpoints can be access by using only the [password], so it is preferred to set the [appPassword] instead.
  /// [loginName] can be any user identifier like the username or the e-mail.
  ///
  /// It is good practice to set the `user-agent` header to allow server admins to identify clients.
  /// Some endpoints require the use of a cookies persistence.
  /// A custom HTTP client can be provided through [httpClient].
  factory NextcloudClient(
    Uri baseURL, {
    String? loginName,
    String? password,
    String? appPassword,
    @Deprecated('Use a custom http client to set the user agent.') String? userAgent,
    http.Client? httpClient,
    @Deprecated('Use a custom http client to persist cookies.') cookie_jar.CookieJar? cookieJar,
  }) {
    var client = httpClient ?? http.Client();
    if (cookieJar != null || userAgent != null) {
      client = CookieJarClient(
        httpClient: httpClient,
        cookieJar: cookieJar,
        baseHeaders: {
          if (userAgent != null) HttpHeaders.userAgentHeader: userAgent,
        },
      );
    }

    final authentications = [
      if (appPassword != null)
        DynamiteHttpBearerAuthentication(
          token: appPassword,
        ),
      if (loginName != null && (password ?? appPassword) != null)
        DynamiteHttpBasicAuthentication(
          username: loginName,
          password: (password ?? appPassword)!,
        ),
    ];

    return NextcloudClient._(
      baseURL,
      httpClient: client,
      authentications: authentications,
    );
  }

  NextcloudClient._(
    super.baseURL, {
    super.httpClient,
    super.authentications,
  });

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) => httpClient.send(request);

  @override
  void close() {
    httpClient.close();

    super.close();
  }
}
