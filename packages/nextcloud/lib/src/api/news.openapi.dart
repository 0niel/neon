// ignore_for_file: camel_case_types
// ignore_for_file: discarded_futures
// ignore_for_file: public_member_api_docs
// ignore_for_file: unreachable_switch_case
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:collection/collection.dart';
import 'package:dynamite_runtime/built_value.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:meta/meta.dart';
import 'package:universal_io/io.dart';
import 'package:uri/uri.dart';

part 'news.openapi.g.dart';

class Client extends DynamiteClient {
  Client(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  Client.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersionsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<SupportedAPIVersions, void>> getSupportedApiVersions() async {
    final rawResponse = getSupportedApiVersionsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [getSupportedApiVersions] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<SupportedAPIVersions, void> getSupportedApiVersionsRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<SupportedAPIVersions, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(SupportedAPIVersions),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFoldersRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> listFolders() async {
    final rawResponse = listFoldersRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFolders] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> listFoldersRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/folders').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListFolders, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFolders, void>> createFolder({required final String name}) async {
    final rawResponse = createFolderRaw(
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [createFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFolders, void> createFolderRaw({required final String name}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['name'] = name;
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/folders').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListFolders, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFolders),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFolder({
    required final int folderId,
    required final String name,
  }) async {
    final rawResponse = renameFolderRaw(
      folderId: folderId,
      name: name,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [name]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFolderRaw({
    required final int folderId,
    required final String name,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['folderId'] = folderId.toString();
    queryParameters['name'] = name;
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'put',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolderRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFolder({required final int folderId}) async {
    final rawResponse = deleteFolderRaw(
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFolder] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFolderRaw({required final int folderId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['folderId'] = folderId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFolderAsRead({
    required final int folderId,
    required final int newestItemId,
  }) async {
    final rawResponse = markFolderAsReadRaw(
      folderId: folderId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId] The newest read item.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFolderAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFolderAsReadRaw({
    required final int folderId,
    required final int newestItemId,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['folderId'] = folderId.toString();
    queryParameters['newestItemId'] = newestItemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/folders/{folderId}/read').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeedsRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> listFeeds() async {
    final rawResponse = listFeedsRaw();

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listFeeds] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> listFeedsRaw() {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListFeeds, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListFeeds, void>> addFeed({
    required final String url,
    final int? folderId,
  }) async {
    final rawResponse = addFeedRaw(
      url: url,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [url]
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [addFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListFeeds, void> addFeedRaw({
    required final String url,
    final int? folderId,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    queryParameters['url'] = url;
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListFeeds, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListFeeds),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> deleteFeed({required final int feedId}) async {
    final rawResponse = deleteFeedRaw(
      feedId: feedId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [deleteFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> deleteFeedRaw({required final int feedId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['feedId'] = feedId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'delete',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> moveFeed({
    required final int feedId,
    final int? folderId,
  }) async {
    final rawResponse = moveFeedRaw(
      feedId: feedId,
      folderId: folderId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [folderId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [moveFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> moveFeedRaw({
    required final int feedId,
    final int? folderId,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['feedId'] = feedId.toString();
    if (folderId != null) {
      queryParameters['folderId'] = folderId.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/move').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeedRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> renameFeed({
    required final int feedId,
    required final String feedTitle,
  }) async {
    final rawResponse = renameFeedRaw(
      feedId: feedId,
      feedTitle: feedTitle,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [feedTitle]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [renameFeed] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> renameFeedRaw({
    required final int feedId,
    required final String feedTitle,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['feedId'] = feedId.toString();
    queryParameters['feedTitle'] = feedTitle;
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/rename').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markFeedAsRead({
    required final int feedId,
    required final int newestItemId,
  }) async {
    final rawResponse = markFeedAsReadRaw(
      feedId: feedId,
      newestItemId: newestItemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [newestItemId]
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markFeedAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markFeedAsReadRaw({
    required final int feedId,
    required final int newestItemId,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['feedId'] = feedId.toString();
    queryParameters['newestItemId'] = newestItemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/feeds/{feedId}/read').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listArticles({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) async {
    final rawResponse = listArticlesRaw(
      type: type,
      id: id,
      getRead: getRead,
      batchSize: batchSize,
      offset: offset,
      oldestFirst: oldestFirst,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [getRead] Defaults to `1`.
  ///   * [batchSize] Defaults to `-1`.
  ///   * [offset] Defaults to `0`.
  ///   * [oldestFirst] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int getRead = 1,
    final int batchSize = -1,
    final int offset = 0,
    final int oldestFirst = 0,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    if (type != 3) {
      queryParameters['type'] = type.toString();
    }
    if (id != 0) {
      queryParameters['id'] = id.toString();
    }
    if (getRead != 1) {
      queryParameters['getRead'] = getRead.toString();
    }
    if (batchSize != -1) {
      queryParameters['batchSize'] = batchSize.toString();
    }
    if (offset != 0) {
      queryParameters['offset'] = offset.toString();
    }
    if (oldestFirst != 0) {
      queryParameters['oldestFirst'] = oldestFirst.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListArticles, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticlesRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<ListArticles, void>> listUpdatedArticles({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) async {
    final rawResponse = listUpdatedArticlesRaw(
      type: type,
      id: id,
      lastModified: lastModified,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Parameters:
  ///   * [type] Defaults to `3`.
  ///   * [id] Defaults to `0`.
  ///   * [lastModified] Defaults to `0`.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [listUpdatedArticles] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<ListArticles, void> listUpdatedArticlesRaw({
    final int type = 3,
    final int id = 0,
    final int lastModified = 0,
  }) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    if (type != 3) {
      queryParameters['type'] = type.toString();
    }
    if (id != 0) {
      queryParameters['id'] = id.toString();
    }
    if (lastModified != 0) {
      queryParameters['lastModified'] = lastModified.toString();
    }
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items/updated').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<ListArticles, void>(
      response: executeRequest(
        'get',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: const FullType(ListArticles),
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsReadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsRead({required final int itemId}) async {
    final rawResponse = markArticleAsReadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsRead] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsReadRaw({required final int itemId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['itemId'] = itemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/read').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnreadRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> markArticleAsUnread({required final int itemId}) async {
    final rawResponse = markArticleAsUnreadRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [markArticleAsUnread] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> markArticleAsUnreadRaw({required final int itemId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['itemId'] = itemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/unread').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> starArticle({required final int itemId}) async {
    final rawResponse = starArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [starArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> starArticleRaw({required final int itemId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['itemId'] = itemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/star').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }

  /// Returns a [Future] containing a [DynamiteResponse] with the status code, deserialized body and headers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticleRaw] for an experimental operation that returns a [DynamiteRawResponse] that can be serialized.
  Future<DynamiteResponse<void, void>> unstarArticle({required final int itemId}) async {
    final rawResponse = unstarArticleRaw(
      itemId: itemId,
    );

    return rawResponse.future;
  }

  /// This method and the response it returns is experimental. The API might change without a major version bump.
  ///
  /// Returns a [Future] containing a [DynamiteRawResponse] with the raw [HttpClientResponse] and serialization helpers.
  /// Throws a [DynamiteApiException] if the API call does not return an expected status code.
  ///
  /// Status codes:
  ///   * 200
  ///
  /// See:
  ///  * [unstarArticle] for an operation that returns a [DynamiteResponse] with a stable API.
  @experimental
  DynamiteRawResponse<void, void> unstarArticleRaw({required final int itemId}) {
    final pathParameters = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{};
    Uint8List? body;

// coverage:ignore-start
    final authentication = authentications.firstWhereOrNull(
      (final auth) => switch (auth) {
        DynamiteHttpBasicAuthentication() => true,
        _ => false,
      },
    );

    if (authentication != null) {
      headers.addAll(
        authentication.headers,
      );
    } else {
      throw Exception('Missing authentication for basic_auth');
    }

// coverage:ignore-end
    pathParameters['itemId'] = itemId.toString();
    var uri = Uri.parse(UriTemplate('/index.php/apps/news/api/v1-3/items/{itemId}/unstar').expand(pathParameters));
    if (queryParameters.isNotEmpty) {
      uri = uri.replace(queryParameters: queryParameters);
    }

    return DynamiteRawResponse<void, void>(
      response: executeRequest(
        'post',
        uri,
        headers,
        body,
        const {200},
      ),
      bodyType: null,
      headersType: null,
      serializers: _jsonSerializers,
    );
  }
}

@BuiltValue(instantiable: false)
abstract interface class SupportedAPIVersionsInterface {
  BuiltList<String>? get apiLevels;
}

abstract class SupportedAPIVersions
    implements SupportedAPIVersionsInterface, Built<SupportedAPIVersions, SupportedAPIVersionsBuilder> {
  factory SupportedAPIVersions([final void Function(SupportedAPIVersionsBuilder)? b]) = _$SupportedAPIVersions;

  // coverage:ignore-start
  const SupportedAPIVersions._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory SupportedAPIVersions.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<SupportedAPIVersions> get serializer => const _$SupportedAPIVersionsSerializer();
}

class _$SupportedAPIVersionsSerializer implements StructuredSerializer<SupportedAPIVersions> {
  const _$SupportedAPIVersionsSerializer();

  @override
  Iterable<Type> get types => const [SupportedAPIVersions, _$SupportedAPIVersions];

  @override
  String get wireName => 'SupportedAPIVersions';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final SupportedAPIVersions object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[];
    Object? value;
    value = object.apiLevels;
    if (value != null) {
      result
        ..add('apiLevels')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(BuiltList, [FullType(String)])),
        );
    }

    return result;
  }

  @override
  SupportedAPIVersions deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupportedAPIVersionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'apiLevels':
          result.apiLevels.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(String)]))!
                as BuiltList<String>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ArticleInterface {
  int get id;
  String get guid;
  String get guidHash;
  String? get url;
  String get title;
  String? get author;
  int get pubDate;
  int? get updatedDate;
  String get body;
  String? get enclosureMime;
  String? get enclosureLink;
  String? get mediaThumbnail;
  String? get mediaDescription;
  int get feedId;
  bool get unread;
  bool get starred;
  int get lastModified;
  bool get rtl;
  String get fingerprint;
  String get contentHash;
}

abstract class Article implements ArticleInterface, Built<Article, ArticleBuilder> {
  factory Article([final void Function(ArticleBuilder)? b]) = _$Article;

  // coverage:ignore-start
  const Article._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Article.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Article> get serializer => const _$ArticleSerializer();
}

class _$ArticleSerializer implements StructuredSerializer<Article> {
  const _$ArticleSerializer();

  @override
  Iterable<Type> get types => const [Article, _$Article];

  @override
  String get wireName => 'Article';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Article object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'guid',
      serializers.serialize(object.guid, specifiedType: const FullType(String)),
      'guidHash',
      serializers.serialize(object.guidHash, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'pubDate',
      serializers.serialize(object.pubDate, specifiedType: const FullType(int)),
      'body',
      serializers.serialize(object.body, specifiedType: const FullType(String)),
      'feedId',
      serializers.serialize(object.feedId, specifiedType: const FullType(int)),
      'unread',
      serializers.serialize(object.unread, specifiedType: const FullType(bool)),
      'starred',
      serializers.serialize(object.starred, specifiedType: const FullType(bool)),
      'lastModified',
      serializers.serialize(object.lastModified, specifiedType: const FullType(int)),
      'rtl',
      serializers.serialize(object.rtl, specifiedType: const FullType(bool)),
      'fingerprint',
      serializers.serialize(object.fingerprint, specifiedType: const FullType(String)),
      'contentHash',
      serializers.serialize(object.contentHash, specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.url;
    if (value != null) {
      result
        ..add('url')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.updatedDate;
    if (value != null) {
      result
        ..add('updatedDate')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.enclosureMime;
    if (value != null) {
      result
        ..add('enclosureMime')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.enclosureLink;
    if (value != null) {
      result
        ..add('enclosureLink')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.mediaThumbnail;
    if (value != null) {
      result
        ..add('mediaThumbnail')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.mediaDescription;
    if (value != null) {
      result
        ..add('mediaDescription')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Article deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ArticleBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'guid':
          result.guid = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'guidHash':
          result.guidHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'author':
          result.author = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'pubDate':
          result.pubDate = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'updatedDate':
          result.updatedDate = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'body':
          result.body = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'enclosureMime':
          result.enclosureMime = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'enclosureLink':
          result.enclosureLink = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mediaThumbnail':
          result.mediaThumbnail = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'mediaDescription':
          result.mediaDescription = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'feedId':
          result.feedId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'unread':
          result.unread = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'starred':
          result.starred = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'lastModified':
          result.lastModified = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'rtl':
          result.rtl = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'fingerprint':
          result.fingerprint = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'contentHash':
          result.contentHash = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class FeedInterface {
  int get id;
  String get url;
  String get title;
  String? get faviconLink;
  int get added;
  int? get folderId;
  int? get unreadCount;
  int get ordering;
  String? get link;
  bool get pinned;
  int get updateErrorCount;
  String? get lastUpdateError;
  BuiltList<Article> get items;
}

abstract class Feed implements FeedInterface, Built<Feed, FeedBuilder> {
  factory Feed([final void Function(FeedBuilder)? b]) = _$Feed;

  // coverage:ignore-start
  const Feed._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Feed.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Feed> get serializer => const _$FeedSerializer();
}

class _$FeedSerializer implements StructuredSerializer<Feed> {
  const _$FeedSerializer();

  @override
  Iterable<Type> get types => const [Feed, _$Feed];

  @override
  String get wireName => 'Feed';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Feed object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title, specifiedType: const FullType(String)),
      'added',
      serializers.serialize(object.added, specifiedType: const FullType(int)),
      'ordering',
      serializers.serialize(object.ordering, specifiedType: const FullType(int)),
      'pinned',
      serializers.serialize(object.pinned, specifiedType: const FullType(bool)),
      'updateErrorCount',
      serializers.serialize(object.updateErrorCount, specifiedType: const FullType(int)),
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(Article)])),
    ];
    Object? value;
    value = object.faviconLink;
    if (value != null) {
      result
        ..add('faviconLink')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.folderId;
    if (value != null) {
      result
        ..add('folderId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.unreadCount;
    if (value != null) {
      result
        ..add('unreadCount')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.link;
    if (value != null) {
      result
        ..add('link')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.lastUpdateError;
    if (value != null) {
      result
        ..add('lastUpdateError')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  Feed deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FeedBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'url':
          result.url = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'title':
          result.title = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'faviconLink':
          result.faviconLink = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'added':
          result.added = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'folderId':
          result.folderId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'unreadCount':
          result.unreadCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'ordering':
          result.ordering = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'link':
          result.link = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'pinned':
          result.pinned = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'updateErrorCount':
          result.updateErrorCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'lastUpdateError':
          result.lastUpdateError = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'items':
          result.items.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Article)]))!
                as BuiltList<Article>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class FolderInterface {
  int get id;
  String get name;
  bool get opened;

  /// This seems to be broken. In testing it is always empty.
  BuiltList<Feed> get feeds;
}

abstract class Folder implements FolderInterface, Built<Folder, FolderBuilder> {
  factory Folder([final void Function(FolderBuilder)? b]) = _$Folder;

  // coverage:ignore-start
  const Folder._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory Folder.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<Folder> get serializer => const _$FolderSerializer();
}

class _$FolderSerializer implements StructuredSerializer<Folder> {
  const _$FolderSerializer();

  @override
  Iterable<Type> get types => const [Folder, _$Folder];

  @override
  String get wireName => 'Folder';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final Folder object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'opened',
      serializers.serialize(object.opened, specifiedType: const FullType(bool)),
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(Feed)])),
    ];
    return result;
  }

  @override
  Folder deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = FolderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'name':
          result.name = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'opened':
          result.opened = serializers.deserialize(value, specifiedType: const FullType(bool))! as bool;
        case 'feeds':
          result.feeds.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Feed)]))!
                as BuiltList<Feed>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ListFoldersInterface {
  BuiltList<Folder> get folders;
}

abstract class ListFolders implements ListFoldersInterface, Built<ListFolders, ListFoldersBuilder> {
  factory ListFolders([final void Function(ListFoldersBuilder)? b]) = _$ListFolders;

  // coverage:ignore-start
  const ListFolders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFolders.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ListFolders> get serializer => const _$ListFoldersSerializer();
}

class _$ListFoldersSerializer implements StructuredSerializer<ListFolders> {
  const _$ListFoldersSerializer();

  @override
  Iterable<Type> get types => const [ListFolders, _$ListFolders];

  @override
  String get wireName => 'ListFolders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ListFolders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'folders',
      serializers.serialize(object.folders, specifiedType: const FullType(BuiltList, [FullType(Folder)])),
    ];
    return result;
  }

  @override
  ListFolders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListFoldersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'folders':
          result.folders.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Folder)]))!
                as BuiltList<Folder>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ListFeedsInterface {
  int? get starredCount;
  int? get newestItemId;
  BuiltList<Feed> get feeds;
}

abstract class ListFeeds implements ListFeedsInterface, Built<ListFeeds, ListFeedsBuilder> {
  factory ListFeeds([final void Function(ListFeedsBuilder)? b]) = _$ListFeeds;

  // coverage:ignore-start
  const ListFeeds._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListFeeds.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ListFeeds> get serializer => const _$ListFeedsSerializer();
}

class _$ListFeedsSerializer implements StructuredSerializer<ListFeeds> {
  const _$ListFeedsSerializer();

  @override
  Iterable<Type> get types => const [ListFeeds, _$ListFeeds];

  @override
  String get wireName => 'ListFeeds';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ListFeeds object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'feeds',
      serializers.serialize(object.feeds, specifiedType: const FullType(BuiltList, [FullType(Feed)])),
    ];
    Object? value;
    value = object.starredCount;
    if (value != null) {
      result
        ..add('starredCount')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    value = object.newestItemId;
    if (value != null) {
      result
        ..add('newestItemId')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(int)),
        );
    }

    return result;
  }

  @override
  ListFeeds deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListFeedsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'starredCount':
          result.starredCount = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'newestItemId':
          result.newestItemId = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'feeds':
          result.feeds.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Feed)]))!
                as BuiltList<Feed>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class ListArticlesInterface {
  BuiltList<Article> get items;
}

abstract class ListArticles implements ListArticlesInterface, Built<ListArticles, ListArticlesBuilder> {
  factory ListArticles([final void Function(ListArticlesBuilder)? b]) = _$ListArticles;

  // coverage:ignore-start
  const ListArticles._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory ListArticles.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<ListArticles> get serializer => const _$ListArticlesSerializer();
}

class _$ListArticlesSerializer implements StructuredSerializer<ListArticles> {
  const _$ListArticlesSerializer();

  @override
  Iterable<Type> get types => const [ListArticles, _$ListArticles];

  @override
  String get wireName => 'ListArticles';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final ListArticles object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'items',
      serializers.serialize(object.items, specifiedType: const FullType(BuiltList, [FullType(Article)])),
    ];
    return result;
  }

  @override
  ListArticles deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = ListArticlesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(Article)]))!
                as BuiltList<Article>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class OCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
}

abstract class OCSMeta implements OCSMetaInterface, Built<OCSMeta, OCSMetaBuilder> {
  factory OCSMeta([final void Function(OCSMetaBuilder)? b]) = _$OCSMeta;

  // coverage:ignore-start
  const OCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory OCSMeta.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<OCSMeta> get serializer => const _$OCSMetaSerializer();
}

class _$OCSMetaSerializer implements StructuredSerializer<OCSMeta> {
  const _$OCSMetaSerializer();

  @override
  Iterable<Type> get types => const [OCSMeta, _$OCSMeta];

  @override
  String get wireName => 'OCSMeta';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final OCSMeta object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(String)),
      'statuscode',
      serializers.serialize(object.statuscode, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.totalitems;
    if (value != null) {
      result
        ..add('totalitems')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    value = object.itemsperpage;
    if (value != null) {
      result
        ..add('itemsperpage')
        ..add(
          serializers.serialize(value, specifiedType: const FullType(String)),
        );
    }

    return result;
  }

  @override
  OCSMeta deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = OCSMetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'statuscode':
          result.statuscode = serializers.deserialize(value, specifiedType: const FullType(int))! as int;
        case 'message':
          result.message = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'totalitems':
          result.totalitems = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
        case 'itemsperpage':
          result.itemsperpage = serializers.deserialize(value, specifiedType: const FullType(String))! as String;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCS_OcsInterface {
  OCSMeta get meta;
  BuiltList<JsonObject> get data;
}

abstract class EmptyOCS_Ocs implements EmptyOCS_OcsInterface, Built<EmptyOCS_Ocs, EmptyOCS_OcsBuilder> {
  factory EmptyOCS_Ocs([final void Function(EmptyOCS_OcsBuilder)? b]) = _$EmptyOCS_Ocs;

  // coverage:ignore-start
  const EmptyOCS_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS_Ocs.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EmptyOCS_Ocs> get serializer => const _$EmptyOCS_OcsSerializer();
}

class _$EmptyOCS_OcsSerializer implements StructuredSerializer<EmptyOCS_Ocs> {
  const _$EmptyOCS_OcsSerializer();

  @override
  Iterable<Type> get types => const [EmptyOCS_Ocs, _$EmptyOCS_Ocs];

  @override
  String get wireName => 'EmptyOCS_Ocs';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EmptyOCS_Ocs object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(OCSMeta)),
      'data',
      serializers.serialize(object.data, specifiedType: const FullType(BuiltList, [FullType(JsonObject)])),
    ];
    return result;
  }

  @override
  EmptyOCS_Ocs deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmptyOCS_OcsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(
            serializers.deserialize(value, specifiedType: const FullType(OCSMeta))! as OCSMeta,
          );
        case 'data':
          result.data.replace(
            serializers.deserialize(value, specifiedType: const FullType(BuiltList, [FullType(JsonObject)]))!
                as BuiltList<JsonObject>,
          );
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class EmptyOCSInterface {
  EmptyOCS_Ocs get ocs;
}

abstract class EmptyOCS implements EmptyOCSInterface, Built<EmptyOCS, EmptyOCSBuilder> {
  factory EmptyOCS([final void Function(EmptyOCSBuilder)? b]) = _$EmptyOCS;

  // coverage:ignore-start
  const EmptyOCS._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory EmptyOCS.fromJson(final Map<String, dynamic> json) => _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end

  @BuiltValueSerializer(custom: true)
  static Serializer<EmptyOCS> get serializer => const _$EmptyOCSSerializer();
}

class _$EmptyOCSSerializer implements StructuredSerializer<EmptyOCS> {
  const _$EmptyOCSSerializer();

  @override
  Iterable<Type> get types => const [EmptyOCS, _$EmptyOCS];

  @override
  String get wireName => 'EmptyOCS';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final EmptyOCS object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'ocs',
      serializers.serialize(object.ocs, specifiedType: const FullType(EmptyOCS_Ocs)),
    ];
    return result;
  }

  @override
  EmptyOCS deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = EmptyOCSBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current;
      switch (key) {
        case 'ocs':
          result.ocs.replace(
            serializers.deserialize(value, specifiedType: const FullType(EmptyOCS_Ocs))! as EmptyOCS_Ocs,
          );
      }
    }

    return result.build();
  }
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..addBuilderFactory(const FullType(SupportedAPIVersions), SupportedAPIVersions.new)
      ..add(SupportedAPIVersions.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new)
      ..addBuilderFactory(const FullType(ListFolders), ListFolders.new)
      ..add(ListFolders.serializer)
      ..addBuilderFactory(const FullType(Folder), Folder.new)
      ..add(Folder.serializer)
      ..addBuilderFactory(const FullType(Feed), Feed.new)
      ..add(Feed.serializer)
      ..addBuilderFactory(const FullType(Article), Article.new)
      ..add(Article.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Article)]), ListBuilder<Article>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Feed)]), ListBuilder<Feed>.new)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(Folder)]), ListBuilder<Folder>.new)
      ..addBuilderFactory(const FullType(ListFeeds), ListFeeds.new)
      ..add(ListFeeds.serializer)
      ..addBuilderFactory(const FullType(ListArticles), ListArticles.new)
      ..add(ListArticles.serializer)
      ..addBuilderFactory(const FullType(OCSMeta), OCSMeta.new)
      ..add(OCSMeta.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS), EmptyOCS.new)
      ..add(EmptyOCS.serializer)
      ..addBuilderFactory(const FullType(EmptyOCS_Ocs), EmptyOCS_Ocs.new)
      ..add(EmptyOCS_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(JsonObject)]), ListBuilder<JsonObject>.new))
    .build();

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..add(DynamiteDoubleSerializer())
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();
// coverage:ignore-end
