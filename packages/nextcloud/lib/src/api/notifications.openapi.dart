// ignore_for_file: camel_case_types
// ignore_for_file: public_member_api_docs
import 'dart:typed_data';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:dynamite_runtime/content_string.dart';
import 'package:dynamite_runtime/http_client.dart';
import 'package:universal_io/io.dart';

export 'package:dynamite_runtime/http_client.dart';

part 'notifications.openapi.g.dart';

class NotificationsResponse<T, U> extends DynamiteResponse<T, U> {
  NotificationsResponse(
    super.data,
    super.headers,
  );

  @override
  String toString() => 'NotificationsResponse(data: $data, headers: $headers)';
}

class NotificationsApiException extends DynamiteApiException {
  NotificationsApiException(
    super.statusCode,
    super.headers,
    super.body,
  );

  static Future<NotificationsApiException> fromResponse(final HttpClientResponse response) async {
    String body;
    try {
      body = await response.body;
    } on FormatException {
      body = 'binary';
    }

    return NotificationsApiException(
      response.statusCode,
      response.responseHeaders,
      body,
    );
  }

  @override
  String toString() => 'NotificationsApiException(statusCode: $statusCode, headers: $headers, body: $body)';
}

class NotificationsClient extends DynamiteClient {
  NotificationsClient(
    super.baseURL, {
    super.baseHeaders,
    super.userAgent,
    super.httpClient,
    super.cookieJar,
    super.authentications,
  });

  NotificationsClient.fromClient(final DynamiteClient client)
      : super(
          client.baseURL,
          baseHeaders: client.baseHeaders,
          httpClient: client.httpClient,
          cookieJar: client.cookieJar,
          authentications: client.authentications,
        );

  NotificationsApiClient get api => NotificationsApiClient(this);
  NotificationsEndpointClient get endpoint => NotificationsEndpointClient(this);
  NotificationsPushClient get push => NotificationsPushClient(this);
  NotificationsSettingsClient get settings => NotificationsSettingsClient(this);
}

class NotificationsApiClient {
  NotificationsApiClient(this._rootClient);

  final NotificationsClient _rootClient;

  /// Generate a notification for a user
  ///
  /// This endpoint requires admin access
  Future<NotificationsApiGenerateNotificationResponseApplicationJson> generateNotification({
    required final String shortMessage,
    required final String userId,
    final String longMessage = '',
    final NotificationsApiGenerateNotificationApiVersion apiVersion = NotificationsApiGenerateNotificationApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/admin_notifications/{userId}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['shortMessage'] = shortMessage;
    path = path.replaceAll('{userId}', Uri.encodeQueryComponent(userId));
    if (longMessage != '') {
      queryParameters['longMessage'] = longMessage;
    }
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsApiGenerateNotificationResponseApplicationJson),
      )! as NotificationsApiGenerateNotificationResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsEndpointClient {
  NotificationsEndpointClient(this._rootClient);

  final NotificationsClient _rootClient;

  /// Get all notifications
  Future<
      NotificationsResponse<NotificationsEndpointListNotificationsResponseApplicationJson,
          NotificationsEndpointEndpointListNotificationsHeaders>> listNotifications({
    final NotificationsEndpointListNotificationsApiVersion apiVersion =
        NotificationsEndpointListNotificationsApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return NotificationsResponse<NotificationsEndpointListNotificationsResponseApplicationJson,
          NotificationsEndpointEndpointListNotificationsHeaders>(
        _jsonSerializers.deserialize(
          await response.jsonBody,
          specifiedType: const FullType(NotificationsEndpointListNotificationsResponseApplicationJson),
        )! as NotificationsEndpointListNotificationsResponseApplicationJson,
        _jsonSerializers.deserialize(
          response.responseHeaders,
          specifiedType: const FullType(NotificationsEndpointEndpointListNotificationsHeaders),
        )! as NotificationsEndpointEndpointListNotificationsHeaders,
      );
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete all notifications
  Future<NotificationsEndpointDeleteAllNotificationsResponseApplicationJson> deleteAllNotifications({
    final NotificationsEndpointDeleteAllNotificationsApiVersion apiVersion =
        NotificationsEndpointDeleteAllNotificationsApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson),
      )! as NotificationsEndpointDeleteAllNotificationsResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Get a notification
  Future<NotificationsEndpointGetNotificationResponseApplicationJson> getNotification({
    required final int id,
    final NotificationsEndpointGetNotificationApiVersion apiVersion = NotificationsEndpointGetNotificationApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'get',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEndpointGetNotificationResponseApplicationJson),
      )! as NotificationsEndpointGetNotificationResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Delete a notification
  Future<NotificationsEndpointDeleteNotificationResponseApplicationJson> deleteNotification({
    required final int id,
    final NotificationsEndpointDeleteNotificationApiVersion apiVersion =
        NotificationsEndpointDeleteNotificationApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/{id}';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{id}', Uri.encodeQueryComponent(id.toString()));
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEndpointDeleteNotificationResponseApplicationJson),
      )! as NotificationsEndpointDeleteNotificationResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Check if notification IDs exist
  Future<NotificationsEndpointConfirmIdsForUserResponseApplicationJson> confirmIdsForUser({
    required final List<int> ids,
    final NotificationsEndpointConfirmIdsForUserApiVersion apiVersion =
        NotificationsEndpointConfirmIdsForUserApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/notifications/exists';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['ids[]'] = ids.map((final e) => e.toString());
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsEndpointConfirmIdsForUserResponseApplicationJson),
      )! as NotificationsEndpointConfirmIdsForUserResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsPushClient {
  NotificationsPushClient(this._rootClient);

  final NotificationsClient _rootClient;

  /// Register device for push notifications
  Future<NotificationsPushRegisterDeviceResponseApplicationJson> registerDevice({
    required final String pushTokenHash,
    required final String devicePublicKey,
    required final String proxyServer,
    final NotificationsPushRegisterDeviceApiVersion apiVersion = NotificationsPushRegisterDeviceApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['pushTokenHash'] = pushTokenHash;
    queryParameters['devicePublicKey'] = devicePublicKey;
    queryParameters['proxyServer'] = proxyServer;
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsPushRegisterDeviceResponseApplicationJson),
      )! as NotificationsPushRegisterDeviceResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Remove a device from push notifications
  Future<NotificationsPushRemoveDeviceResponseApplicationJson> removeDevice({
    final NotificationsPushRemoveDeviceApiVersion apiVersion = NotificationsPushRemoveDeviceApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/push';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'delete',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200 || response.statusCode == 202 || response.statusCode == 401) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsPushRemoveDeviceResponseApplicationJson),
      )! as NotificationsPushRemoveDeviceResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsSettingsClient {
  NotificationsSettingsClient(this._rootClient);

  final NotificationsClient _rootClient;

  /// Update personal notification settings
  Future<NotificationsSettingsPersonalResponseApplicationJson> personal({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final NotificationsSettingsPersonalApiVersion apiVersion = NotificationsSettingsPersonalApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/settings';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['batchSetting'] = batchSetting.toString();
    queryParameters['soundNotification'] = soundNotification;
    queryParameters['soundTalk'] = soundTalk;
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsSettingsPersonalResponseApplicationJson),
      )! as NotificationsSettingsPersonalResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }

  /// Update default notification settings for new users
  ///
  /// This endpoint requires admin access
  Future<NotificationsSettingsAdminResponseApplicationJson> admin({
    required final int batchSetting,
    required final String soundNotification,
    required final String soundTalk,
    final NotificationsSettingsAdminApiVersion apiVersion = NotificationsSettingsAdminApiVersion.v2,
    final String oCSAPIRequest = 'true',
  }) async {
    var path = '/ocs/v2.php/apps/notifications/api/{apiVersion}/settings/admin';
    final queryParameters = <String, dynamic>{};
    final headers = <String, String>{
      'Accept': 'application/json',
    };
    Uint8List? body;
    // coverage:ignore-start
    if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'bearer').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'bearer').headers,
      );
    } else if (_rootClient.authentications.where((final a) => a.type == 'http' && a.scheme == 'basic').isNotEmpty) {
      headers.addAll(
        _rootClient.authentications.singleWhere((final a) => a.type == 'http' && a.scheme == 'basic').headers,
      );
    } else {
      throw Exception('Missing authentication for bearer_auth or basic_auth');
    }
    // coverage:ignore-end
    queryParameters['batchSetting'] = batchSetting.toString();
    queryParameters['soundNotification'] = soundNotification;
    queryParameters['soundTalk'] = soundTalk;
    path = path.replaceAll('{apiVersion}', Uri.encodeQueryComponent(apiVersion.name));
    headers['OCS-APIRequest'] = oCSAPIRequest;
    final response = await _rootClient.doRequest(
      'post',
      Uri(path: path, queryParameters: queryParameters.isNotEmpty ? queryParameters : null),
      headers,
      body,
    );
    if (response.statusCode == 200) {
      return _jsonSerializers.deserialize(
        await response.jsonBody,
        specifiedType: const FullType(NotificationsSettingsAdminResponseApplicationJson),
      )! as NotificationsSettingsAdminResponseApplicationJson;
    }
    throw await NotificationsApiException.fromResponse(response); // coverage:ignore-line
  }
}

class NotificationsApiGenerateNotificationApiVersion extends EnumClass {
  const NotificationsApiGenerateNotificationApiVersion._(super.name);

  static const NotificationsApiGenerateNotificationApiVersion v1 = _$notificationsApiGenerateNotificationApiVersionV1;

  static const NotificationsApiGenerateNotificationApiVersion v2 = _$notificationsApiGenerateNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsApiGenerateNotificationApiVersion> get values =>
      _$notificationsApiGenerateNotificationApiVersionValues;
  // coverage:ignore-end
  static NotificationsApiGenerateNotificationApiVersion valueOf(final String name) =>
      _$valueOfNotificationsApiGenerateNotificationApiVersion(name);
  static Serializer<NotificationsApiGenerateNotificationApiVersion> get serializer =>
      _$notificationsApiGenerateNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsOCSMetaInterface {
  String get status;
  int get statuscode;
  String? get message;
  String? get totalitems;
  String? get itemsperpage;
  NotificationsOCSMetaInterface rebuild(final void Function(NotificationsOCSMetaInterfaceBuilder) updates);
  NotificationsOCSMetaInterfaceBuilder toBuilder();
}

abstract class NotificationsOCSMeta
    implements NotificationsOCSMetaInterface, Built<NotificationsOCSMeta, NotificationsOCSMetaBuilder> {
  factory NotificationsOCSMeta([final void Function(NotificationsOCSMetaBuilder)? b]) = _$NotificationsOCSMeta;

  // coverage:ignore-start
  const NotificationsOCSMeta._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsOCSMeta.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsOCSMeta> get serializer => _$notificationsOCSMetaSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsApiGenerateNotificationResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsApiGenerateNotificationResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsApiGenerateNotificationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsApiGenerateNotificationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsApiGenerateNotificationResponseApplicationJson_Ocs
    implements
        NotificationsApiGenerateNotificationResponseApplicationJson_OcsInterface,
        Built<NotificationsApiGenerateNotificationResponseApplicationJson_Ocs,
            NotificationsApiGenerateNotificationResponseApplicationJson_OcsBuilder> {
  factory NotificationsApiGenerateNotificationResponseApplicationJson_Ocs([
    final void Function(NotificationsApiGenerateNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsApiGenerateNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsApiGenerateNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsApiGenerateNotificationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsApiGenerateNotificationResponseApplicationJson_Ocs> get serializer =>
      _$notificationsApiGenerateNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsApiGenerateNotificationResponseApplicationJsonInterface {
  NotificationsApiGenerateNotificationResponseApplicationJson_Ocs get ocs;
  NotificationsApiGenerateNotificationResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsApiGenerateNotificationResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsApiGenerateNotificationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsApiGenerateNotificationResponseApplicationJson
    implements
        NotificationsApiGenerateNotificationResponseApplicationJsonInterface,
        Built<NotificationsApiGenerateNotificationResponseApplicationJson,
            NotificationsApiGenerateNotificationResponseApplicationJsonBuilder> {
  factory NotificationsApiGenerateNotificationResponseApplicationJson([
    final void Function(NotificationsApiGenerateNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsApiGenerateNotificationResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsApiGenerateNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsApiGenerateNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsApiGenerateNotificationResponseApplicationJson> get serializer =>
      _$notificationsApiGenerateNotificationResponseApplicationJsonSerializer;
}

class NotificationsEndpointListNotificationsApiVersion extends EnumClass {
  const NotificationsEndpointListNotificationsApiVersion._(super.name);

  static const NotificationsEndpointListNotificationsApiVersion v1 =
      _$notificationsEndpointListNotificationsApiVersionV1;

  static const NotificationsEndpointListNotificationsApiVersion v2 =
      _$notificationsEndpointListNotificationsApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsEndpointListNotificationsApiVersion> get values =>
      _$notificationsEndpointListNotificationsApiVersionValues;
  // coverage:ignore-end
  static NotificationsEndpointListNotificationsApiVersion valueOf(final String name) =>
      _$valueOfNotificationsEndpointListNotificationsApiVersion(name);
  static Serializer<NotificationsEndpointListNotificationsApiVersion> get serializer =>
      _$notificationsEndpointListNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointEndpointListNotificationsHeadersInterface {
  @BuiltValueField(wireName: 'x-nextcloud-user-status')
  String? get xNextcloudUserStatus;
  NotificationsEndpointEndpointListNotificationsHeadersInterface rebuild(
    final void Function(NotificationsEndpointEndpointListNotificationsHeadersInterfaceBuilder) updates,
  );
  NotificationsEndpointEndpointListNotificationsHeadersInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointEndpointListNotificationsHeaders
    implements
        NotificationsEndpointEndpointListNotificationsHeadersInterface,
        Built<NotificationsEndpointEndpointListNotificationsHeaders,
            NotificationsEndpointEndpointListNotificationsHeadersBuilder> {
  factory NotificationsEndpointEndpointListNotificationsHeaders([
    final void Function(NotificationsEndpointEndpointListNotificationsHeadersBuilder)? b,
  ]) = _$NotificationsEndpointEndpointListNotificationsHeaders;

  // coverage:ignore-start
  const NotificationsEndpointEndpointListNotificationsHeaders._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointEndpointListNotificationsHeaders.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  @BuiltValueSerializer(custom: true)
  static Serializer<NotificationsEndpointEndpointListNotificationsHeaders> get serializer =>
      _$NotificationsEndpointEndpointListNotificationsHeadersSerializer();
}

class _$NotificationsEndpointEndpointListNotificationsHeadersSerializer
    implements StructuredSerializer<NotificationsEndpointEndpointListNotificationsHeaders> {
  @override
  final Iterable<Type> types = const [
    NotificationsEndpointEndpointListNotificationsHeaders,
    _$NotificationsEndpointEndpointListNotificationsHeaders,
  ];

  @override
  final String wireName = 'NotificationsEndpointEndpointListNotificationsHeaders';

  @override
  Iterable<Object?> serialize(
    final Serializers serializers,
    final NotificationsEndpointEndpointListNotificationsHeaders object, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    throw UnimplementedError();
  }

  @override
  NotificationsEndpointEndpointListNotificationsHeaders deserialize(
    final Serializers serializers,
    final Iterable<Object?> serialized, {
    final FullType specifiedType = FullType.unspecified,
  }) {
    final result = NotificationsEndpointEndpointListNotificationsHeadersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final value = iterator.current! as String;
      switch (key) {
        case 'x-nextcloud-user-status':
          result.xNextcloudUserStatus = value;
      }
    }

    return result.build();
  }
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsNotificationActionInterface {
  String get label;
  String get link;
  String get type;
  bool get primary;
  NotificationsNotificationActionInterface rebuild(
    final void Function(NotificationsNotificationActionInterfaceBuilder) updates,
  );
  NotificationsNotificationActionInterfaceBuilder toBuilder();
}

abstract class NotificationsNotificationAction
    implements
        NotificationsNotificationActionInterface,
        Built<NotificationsNotificationAction, NotificationsNotificationActionBuilder> {
  factory NotificationsNotificationAction([final void Function(NotificationsNotificationActionBuilder)? b]) =
      _$NotificationsNotificationAction;

  // coverage:ignore-start
  const NotificationsNotificationAction._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsNotificationAction.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsNotificationAction> get serializer => _$notificationsNotificationActionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsNotificationInterface {
  @BuiltValueField(wireName: 'notification_id')
  int get notificationId;
  String get app;
  String get user;
  String get datetime;
  @BuiltValueField(wireName: 'object_type')
  String get objectType;
  @BuiltValueField(wireName: 'object_id')
  String get objectId;
  String get subject;
  String get message;
  String get link;
  BuiltList<NotificationsNotificationAction> get actions;
  String? get subjectRich;
  BuiltMap<String, JsonObject>? get subjectRichParameters;
  String? get messageRich;
  BuiltMap<String, JsonObject>? get messageRichParameters;
  String? get icon;
  bool? get shouldNotify;
  NotificationsNotificationInterface rebuild(final void Function(NotificationsNotificationInterfaceBuilder) updates);
  NotificationsNotificationInterfaceBuilder toBuilder();
}

abstract class NotificationsNotification
    implements NotificationsNotificationInterface, Built<NotificationsNotification, NotificationsNotificationBuilder> {
  factory NotificationsNotification([final void Function(NotificationsNotificationBuilder)? b]) =
      _$NotificationsNotification;

  // coverage:ignore-start
  const NotificationsNotification._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsNotification.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsNotification> get serializer => _$notificationsNotificationSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointListNotificationsResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  BuiltList<NotificationsNotification> get data;
  NotificationsEndpointListNotificationsResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsEndpointListNotificationsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsEndpointListNotificationsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointListNotificationsResponseApplicationJson_Ocs
    implements
        NotificationsEndpointListNotificationsResponseApplicationJson_OcsInterface,
        Built<NotificationsEndpointListNotificationsResponseApplicationJson_Ocs,
            NotificationsEndpointListNotificationsResponseApplicationJson_OcsBuilder> {
  factory NotificationsEndpointListNotificationsResponseApplicationJson_Ocs([
    final void Function(NotificationsEndpointListNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsEndpointListNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsEndpointListNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointListNotificationsResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointListNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$notificationsEndpointListNotificationsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointListNotificationsResponseApplicationJsonInterface {
  NotificationsEndpointListNotificationsResponseApplicationJson_Ocs get ocs;
  NotificationsEndpointListNotificationsResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsEndpointListNotificationsResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsEndpointListNotificationsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointListNotificationsResponseApplicationJson
    implements
        NotificationsEndpointListNotificationsResponseApplicationJsonInterface,
        Built<NotificationsEndpointListNotificationsResponseApplicationJson,
            NotificationsEndpointListNotificationsResponseApplicationJsonBuilder> {
  factory NotificationsEndpointListNotificationsResponseApplicationJson([
    final void Function(NotificationsEndpointListNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsEndpointListNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsEndpointListNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointListNotificationsResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointListNotificationsResponseApplicationJson> get serializer =>
      _$notificationsEndpointListNotificationsResponseApplicationJsonSerializer;
}

class NotificationsEndpointDeleteAllNotificationsApiVersion extends EnumClass {
  const NotificationsEndpointDeleteAllNotificationsApiVersion._(super.name);

  static const NotificationsEndpointDeleteAllNotificationsApiVersion v1 =
      _$notificationsEndpointDeleteAllNotificationsApiVersionV1;

  static const NotificationsEndpointDeleteAllNotificationsApiVersion v2 =
      _$notificationsEndpointDeleteAllNotificationsApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsEndpointDeleteAllNotificationsApiVersion> get values =>
      _$notificationsEndpointDeleteAllNotificationsApiVersionValues;
  // coverage:ignore-end
  static NotificationsEndpointDeleteAllNotificationsApiVersion valueOf(final String name) =>
      _$valueOfNotificationsEndpointDeleteAllNotificationsApiVersion(name);
  static Serializer<NotificationsEndpointDeleteAllNotificationsApiVersion> get serializer =>
      _$notificationsEndpointDeleteAllNotificationsApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs
    implements
        NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsInterface,
        Built<NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs,
            NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder> {
  factory NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs([
    final void Function(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs> get serializer =>
      _$notificationsEndpointDeleteAllNotificationsResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonInterface {
  NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs get ocs;
  NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointDeleteAllNotificationsResponseApplicationJson
    implements
        NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonInterface,
        Built<NotificationsEndpointDeleteAllNotificationsResponseApplicationJson,
            NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonBuilder> {
  factory NotificationsEndpointDeleteAllNotificationsResponseApplicationJson([
    final void Function(NotificationsEndpointDeleteAllNotificationsResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsEndpointDeleteAllNotificationsResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsEndpointDeleteAllNotificationsResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointDeleteAllNotificationsResponseApplicationJson.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointDeleteAllNotificationsResponseApplicationJson> get serializer =>
      _$notificationsEndpointDeleteAllNotificationsResponseApplicationJsonSerializer;
}

class NotificationsEndpointGetNotificationApiVersion extends EnumClass {
  const NotificationsEndpointGetNotificationApiVersion._(super.name);

  static const NotificationsEndpointGetNotificationApiVersion v1 = _$notificationsEndpointGetNotificationApiVersionV1;

  static const NotificationsEndpointGetNotificationApiVersion v2 = _$notificationsEndpointGetNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsEndpointGetNotificationApiVersion> get values =>
      _$notificationsEndpointGetNotificationApiVersionValues;
  // coverage:ignore-end
  static NotificationsEndpointGetNotificationApiVersion valueOf(final String name) =>
      _$valueOfNotificationsEndpointGetNotificationApiVersion(name);
  static Serializer<NotificationsEndpointGetNotificationApiVersion> get serializer =>
      _$notificationsEndpointGetNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointGetNotificationResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  NotificationsNotification get data;
  NotificationsEndpointGetNotificationResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsEndpointGetNotificationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsEndpointGetNotificationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointGetNotificationResponseApplicationJson_Ocs
    implements
        NotificationsEndpointGetNotificationResponseApplicationJson_OcsInterface,
        Built<NotificationsEndpointGetNotificationResponseApplicationJson_Ocs,
            NotificationsEndpointGetNotificationResponseApplicationJson_OcsBuilder> {
  factory NotificationsEndpointGetNotificationResponseApplicationJson_Ocs([
    final void Function(NotificationsEndpointGetNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsEndpointGetNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsEndpointGetNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointGetNotificationResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointGetNotificationResponseApplicationJson_Ocs> get serializer =>
      _$notificationsEndpointGetNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointGetNotificationResponseApplicationJsonInterface {
  NotificationsEndpointGetNotificationResponseApplicationJson_Ocs get ocs;
  NotificationsEndpointGetNotificationResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsEndpointGetNotificationResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsEndpointGetNotificationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointGetNotificationResponseApplicationJson
    implements
        NotificationsEndpointGetNotificationResponseApplicationJsonInterface,
        Built<NotificationsEndpointGetNotificationResponseApplicationJson,
            NotificationsEndpointGetNotificationResponseApplicationJsonBuilder> {
  factory NotificationsEndpointGetNotificationResponseApplicationJson([
    final void Function(NotificationsEndpointGetNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsEndpointGetNotificationResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsEndpointGetNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointGetNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointGetNotificationResponseApplicationJson> get serializer =>
      _$notificationsEndpointGetNotificationResponseApplicationJsonSerializer;
}

class NotificationsEndpointDeleteNotificationApiVersion extends EnumClass {
  const NotificationsEndpointDeleteNotificationApiVersion._(super.name);

  static const NotificationsEndpointDeleteNotificationApiVersion v1 =
      _$notificationsEndpointDeleteNotificationApiVersionV1;

  static const NotificationsEndpointDeleteNotificationApiVersion v2 =
      _$notificationsEndpointDeleteNotificationApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsEndpointDeleteNotificationApiVersion> get values =>
      _$notificationsEndpointDeleteNotificationApiVersionValues;
  // coverage:ignore-end
  static NotificationsEndpointDeleteNotificationApiVersion valueOf(final String name) =>
      _$valueOfNotificationsEndpointDeleteNotificationApiVersion(name);
  static Serializer<NotificationsEndpointDeleteNotificationApiVersion> get serializer =>
      _$notificationsEndpointDeleteNotificationApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs
    implements
        NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsInterface,
        Built<NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs,
            NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsBuilder> {
  factory NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs([
    final void Function(NotificationsEndpointDeleteNotificationResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs.fromJson(
    final Map<String, dynamic> json,
  ) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs> get serializer =>
      _$notificationsEndpointDeleteNotificationResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointDeleteNotificationResponseApplicationJsonInterface {
  NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs get ocs;
  NotificationsEndpointDeleteNotificationResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsEndpointDeleteNotificationResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsEndpointDeleteNotificationResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointDeleteNotificationResponseApplicationJson
    implements
        NotificationsEndpointDeleteNotificationResponseApplicationJsonInterface,
        Built<NotificationsEndpointDeleteNotificationResponseApplicationJson,
            NotificationsEndpointDeleteNotificationResponseApplicationJsonBuilder> {
  factory NotificationsEndpointDeleteNotificationResponseApplicationJson([
    final void Function(NotificationsEndpointDeleteNotificationResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsEndpointDeleteNotificationResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsEndpointDeleteNotificationResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointDeleteNotificationResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointDeleteNotificationResponseApplicationJson> get serializer =>
      _$notificationsEndpointDeleteNotificationResponseApplicationJsonSerializer;
}

class NotificationsEndpointConfirmIdsForUserApiVersion extends EnumClass {
  const NotificationsEndpointConfirmIdsForUserApiVersion._(super.name);

  static const NotificationsEndpointConfirmIdsForUserApiVersion v1 =
      _$notificationsEndpointConfirmIdsForUserApiVersionV1;

  static const NotificationsEndpointConfirmIdsForUserApiVersion v2 =
      _$notificationsEndpointConfirmIdsForUserApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsEndpointConfirmIdsForUserApiVersion> get values =>
      _$notificationsEndpointConfirmIdsForUserApiVersionValues;
  // coverage:ignore-end
  static NotificationsEndpointConfirmIdsForUserApiVersion valueOf(final String name) =>
      _$valueOfNotificationsEndpointConfirmIdsForUserApiVersion(name);
  static Serializer<NotificationsEndpointConfirmIdsForUserApiVersion> get serializer =>
      _$notificationsEndpointConfirmIdsForUserApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  BuiltList<int> get data;
  NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs
    implements
        NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsInterface,
        Built<NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs,
            NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder> {
  factory NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs([
    final void Function(NotificationsEndpointConfirmIdsForUserResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs> get serializer =>
      _$notificationsEndpointConfirmIdsForUserResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsEndpointConfirmIdsForUserResponseApplicationJsonInterface {
  NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs get ocs;
  NotificationsEndpointConfirmIdsForUserResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsEndpointConfirmIdsForUserResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsEndpointConfirmIdsForUserResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsEndpointConfirmIdsForUserResponseApplicationJson
    implements
        NotificationsEndpointConfirmIdsForUserResponseApplicationJsonInterface,
        Built<NotificationsEndpointConfirmIdsForUserResponseApplicationJson,
            NotificationsEndpointConfirmIdsForUserResponseApplicationJsonBuilder> {
  factory NotificationsEndpointConfirmIdsForUserResponseApplicationJson([
    final void Function(NotificationsEndpointConfirmIdsForUserResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsEndpointConfirmIdsForUserResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsEndpointConfirmIdsForUserResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsEndpointConfirmIdsForUserResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsEndpointConfirmIdsForUserResponseApplicationJson> get serializer =>
      _$notificationsEndpointConfirmIdsForUserResponseApplicationJsonSerializer;
}

class NotificationsPushRegisterDeviceApiVersion extends EnumClass {
  const NotificationsPushRegisterDeviceApiVersion._(super.name);

  static const NotificationsPushRegisterDeviceApiVersion v2 = _$notificationsPushRegisterDeviceApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsPushRegisterDeviceApiVersion> get values =>
      _$notificationsPushRegisterDeviceApiVersionValues;
  // coverage:ignore-end
  static NotificationsPushRegisterDeviceApiVersion valueOf(final String name) =>
      _$valueOfNotificationsPushRegisterDeviceApiVersion(name);
  static Serializer<NotificationsPushRegisterDeviceApiVersion> get serializer =>
      _$notificationsPushRegisterDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsPushDeviceInterface {
  String get publicKey;
  String get deviceIdentifier;
  String get signature;
  NotificationsPushDeviceInterface rebuild(final void Function(NotificationsPushDeviceInterfaceBuilder) updates);
  NotificationsPushDeviceInterfaceBuilder toBuilder();
}

abstract class NotificationsPushDevice
    implements NotificationsPushDeviceInterface, Built<NotificationsPushDevice, NotificationsPushDeviceBuilder> {
  factory NotificationsPushDevice([final void Function(NotificationsPushDeviceBuilder)? b]) = _$NotificationsPushDevice;

  // coverage:ignore-start
  const NotificationsPushDevice._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushDevice.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsPushDevice> get serializer => _$notificationsPushDeviceSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsPushRegisterDeviceResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  NotificationsPushDevice get data;
  NotificationsPushRegisterDeviceResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsPushRegisterDeviceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsPushRegisterDeviceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsPushRegisterDeviceResponseApplicationJson_Ocs
    implements
        NotificationsPushRegisterDeviceResponseApplicationJson_OcsInterface,
        Built<NotificationsPushRegisterDeviceResponseApplicationJson_Ocs,
            NotificationsPushRegisterDeviceResponseApplicationJson_OcsBuilder> {
  factory NotificationsPushRegisterDeviceResponseApplicationJson_Ocs([
    final void Function(NotificationsPushRegisterDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsPushRegisterDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsPushRegisterDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushRegisterDeviceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsPushRegisterDeviceResponseApplicationJson_Ocs> get serializer =>
      _$notificationsPushRegisterDeviceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsPushRegisterDeviceResponseApplicationJsonInterface {
  NotificationsPushRegisterDeviceResponseApplicationJson_Ocs get ocs;
  NotificationsPushRegisterDeviceResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsPushRegisterDeviceResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsPushRegisterDeviceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsPushRegisterDeviceResponseApplicationJson
    implements
        NotificationsPushRegisterDeviceResponseApplicationJsonInterface,
        Built<NotificationsPushRegisterDeviceResponseApplicationJson,
            NotificationsPushRegisterDeviceResponseApplicationJsonBuilder> {
  factory NotificationsPushRegisterDeviceResponseApplicationJson([
    final void Function(NotificationsPushRegisterDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsPushRegisterDeviceResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsPushRegisterDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushRegisterDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsPushRegisterDeviceResponseApplicationJson> get serializer =>
      _$notificationsPushRegisterDeviceResponseApplicationJsonSerializer;
}

class NotificationsPushRemoveDeviceApiVersion extends EnumClass {
  const NotificationsPushRemoveDeviceApiVersion._(super.name);

  static const NotificationsPushRemoveDeviceApiVersion v2 = _$notificationsPushRemoveDeviceApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsPushRemoveDeviceApiVersion> get values =>
      _$notificationsPushRemoveDeviceApiVersionValues;
  // coverage:ignore-end
  static NotificationsPushRemoveDeviceApiVersion valueOf(final String name) =>
      _$valueOfNotificationsPushRemoveDeviceApiVersion(name);
  static Serializer<NotificationsPushRemoveDeviceApiVersion> get serializer =>
      _$notificationsPushRemoveDeviceApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsPushRemoveDeviceResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsPushRemoveDeviceResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsPushRemoveDeviceResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsPushRemoveDeviceResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsPushRemoveDeviceResponseApplicationJson_Ocs
    implements
        NotificationsPushRemoveDeviceResponseApplicationJson_OcsInterface,
        Built<NotificationsPushRemoveDeviceResponseApplicationJson_Ocs,
            NotificationsPushRemoveDeviceResponseApplicationJson_OcsBuilder> {
  factory NotificationsPushRemoveDeviceResponseApplicationJson_Ocs([
    final void Function(NotificationsPushRemoveDeviceResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsPushRemoveDeviceResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsPushRemoveDeviceResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushRemoveDeviceResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsPushRemoveDeviceResponseApplicationJson_Ocs> get serializer =>
      _$notificationsPushRemoveDeviceResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsPushRemoveDeviceResponseApplicationJsonInterface {
  NotificationsPushRemoveDeviceResponseApplicationJson_Ocs get ocs;
  NotificationsPushRemoveDeviceResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsPushRemoveDeviceResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsPushRemoveDeviceResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsPushRemoveDeviceResponseApplicationJson
    implements
        NotificationsPushRemoveDeviceResponseApplicationJsonInterface,
        Built<NotificationsPushRemoveDeviceResponseApplicationJson,
            NotificationsPushRemoveDeviceResponseApplicationJsonBuilder> {
  factory NotificationsPushRemoveDeviceResponseApplicationJson([
    final void Function(NotificationsPushRemoveDeviceResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsPushRemoveDeviceResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsPushRemoveDeviceResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsPushRemoveDeviceResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsPushRemoveDeviceResponseApplicationJson> get serializer =>
      _$notificationsPushRemoveDeviceResponseApplicationJsonSerializer;
}

class NotificationsSettingsPersonalApiVersion extends EnumClass {
  const NotificationsSettingsPersonalApiVersion._(super.name);

  static const NotificationsSettingsPersonalApiVersion v2 = _$notificationsSettingsPersonalApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsSettingsPersonalApiVersion> get values =>
      _$notificationsSettingsPersonalApiVersionValues;
  // coverage:ignore-end
  static NotificationsSettingsPersonalApiVersion valueOf(final String name) =>
      _$valueOfNotificationsSettingsPersonalApiVersion(name);
  static Serializer<NotificationsSettingsPersonalApiVersion> get serializer =>
      _$notificationsSettingsPersonalApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsSettingsPersonalResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsSettingsPersonalResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsSettingsPersonalResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsSettingsPersonalResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsSettingsPersonalResponseApplicationJson_Ocs
    implements
        NotificationsSettingsPersonalResponseApplicationJson_OcsInterface,
        Built<NotificationsSettingsPersonalResponseApplicationJson_Ocs,
            NotificationsSettingsPersonalResponseApplicationJson_OcsBuilder> {
  factory NotificationsSettingsPersonalResponseApplicationJson_Ocs([
    final void Function(NotificationsSettingsPersonalResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsSettingsPersonalResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsSettingsPersonalResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsSettingsPersonalResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsSettingsPersonalResponseApplicationJson_Ocs> get serializer =>
      _$notificationsSettingsPersonalResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsSettingsPersonalResponseApplicationJsonInterface {
  NotificationsSettingsPersonalResponseApplicationJson_Ocs get ocs;
  NotificationsSettingsPersonalResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsSettingsPersonalResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsSettingsPersonalResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsSettingsPersonalResponseApplicationJson
    implements
        NotificationsSettingsPersonalResponseApplicationJsonInterface,
        Built<NotificationsSettingsPersonalResponseApplicationJson,
            NotificationsSettingsPersonalResponseApplicationJsonBuilder> {
  factory NotificationsSettingsPersonalResponseApplicationJson([
    final void Function(NotificationsSettingsPersonalResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsSettingsPersonalResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsSettingsPersonalResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsSettingsPersonalResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsSettingsPersonalResponseApplicationJson> get serializer =>
      _$notificationsSettingsPersonalResponseApplicationJsonSerializer;
}

class NotificationsSettingsAdminApiVersion extends EnumClass {
  const NotificationsSettingsAdminApiVersion._(super.name);

  static const NotificationsSettingsAdminApiVersion v2 = _$notificationsSettingsAdminApiVersionV2;

  // coverage:ignore-start
  static BuiltSet<NotificationsSettingsAdminApiVersion> get values => _$notificationsSettingsAdminApiVersionValues;
  // coverage:ignore-end
  static NotificationsSettingsAdminApiVersion valueOf(final String name) =>
      _$valueOfNotificationsSettingsAdminApiVersion(name);
  static Serializer<NotificationsSettingsAdminApiVersion> get serializer =>
      _$notificationsSettingsAdminApiVersionSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsSettingsAdminResponseApplicationJson_OcsInterface {
  NotificationsOCSMeta get meta;
  JsonObject get data;
  NotificationsSettingsAdminResponseApplicationJson_OcsInterface rebuild(
    final void Function(NotificationsSettingsAdminResponseApplicationJson_OcsInterfaceBuilder) updates,
  );
  NotificationsSettingsAdminResponseApplicationJson_OcsInterfaceBuilder toBuilder();
}

abstract class NotificationsSettingsAdminResponseApplicationJson_Ocs
    implements
        NotificationsSettingsAdminResponseApplicationJson_OcsInterface,
        Built<NotificationsSettingsAdminResponseApplicationJson_Ocs,
            NotificationsSettingsAdminResponseApplicationJson_OcsBuilder> {
  factory NotificationsSettingsAdminResponseApplicationJson_Ocs([
    final void Function(NotificationsSettingsAdminResponseApplicationJson_OcsBuilder)? b,
  ]) = _$NotificationsSettingsAdminResponseApplicationJson_Ocs;

  // coverage:ignore-start
  const NotificationsSettingsAdminResponseApplicationJson_Ocs._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsSettingsAdminResponseApplicationJson_Ocs.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsSettingsAdminResponseApplicationJson_Ocs> get serializer =>
      _$notificationsSettingsAdminResponseApplicationJsonOcsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsSettingsAdminResponseApplicationJsonInterface {
  NotificationsSettingsAdminResponseApplicationJson_Ocs get ocs;
  NotificationsSettingsAdminResponseApplicationJsonInterface rebuild(
    final void Function(NotificationsSettingsAdminResponseApplicationJsonInterfaceBuilder) updates,
  );
  NotificationsSettingsAdminResponseApplicationJsonInterfaceBuilder toBuilder();
}

abstract class NotificationsSettingsAdminResponseApplicationJson
    implements
        NotificationsSettingsAdminResponseApplicationJsonInterface,
        Built<NotificationsSettingsAdminResponseApplicationJson,
            NotificationsSettingsAdminResponseApplicationJsonBuilder> {
  factory NotificationsSettingsAdminResponseApplicationJson([
    final void Function(NotificationsSettingsAdminResponseApplicationJsonBuilder)? b,
  ]) = _$NotificationsSettingsAdminResponseApplicationJson;

  // coverage:ignore-start
  const NotificationsSettingsAdminResponseApplicationJson._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsSettingsAdminResponseApplicationJson.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsSettingsAdminResponseApplicationJson> get serializer =>
      _$notificationsSettingsAdminResponseApplicationJsonSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsCapabilities_NotificationsInterface {
  @BuiltValueField(wireName: 'ocs-endpoints')
  BuiltList<String> get ocsEndpoints;
  BuiltList<String> get push;
  @BuiltValueField(wireName: 'admin-notifications')
  BuiltList<String> get adminNotifications;
  NotificationsCapabilities_NotificationsInterface rebuild(
    final void Function(NotificationsCapabilities_NotificationsInterfaceBuilder) updates,
  );
  NotificationsCapabilities_NotificationsInterfaceBuilder toBuilder();
}

abstract class NotificationsCapabilities_Notifications
    implements
        NotificationsCapabilities_NotificationsInterface,
        Built<NotificationsCapabilities_Notifications, NotificationsCapabilities_NotificationsBuilder> {
  factory NotificationsCapabilities_Notifications([
    final void Function(NotificationsCapabilities_NotificationsBuilder)? b,
  ]) = _$NotificationsCapabilities_Notifications;

  // coverage:ignore-start
  const NotificationsCapabilities_Notifications._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities_Notifications.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsCapabilities_Notifications> get serializer =>
      _$notificationsCapabilitiesNotificationsSerializer;
}

@BuiltValue(instantiable: false)
abstract interface class NotificationsCapabilitiesInterface {
  NotificationsCapabilities_Notifications get notifications;
  NotificationsCapabilitiesInterface rebuild(final void Function(NotificationsCapabilitiesInterfaceBuilder) updates);
  NotificationsCapabilitiesInterfaceBuilder toBuilder();
}

abstract class NotificationsCapabilities
    implements NotificationsCapabilitiesInterface, Built<NotificationsCapabilities, NotificationsCapabilitiesBuilder> {
  factory NotificationsCapabilities([final void Function(NotificationsCapabilitiesBuilder)? b]) =
      _$NotificationsCapabilities;

  // coverage:ignore-start
  const NotificationsCapabilities._();
  // coverage:ignore-end

  // coverage:ignore-start
  factory NotificationsCapabilities.fromJson(final Map<String, dynamic> json) =>
      _jsonSerializers.deserializeWith(serializer, json)!;
  // coverage:ignore-end

  // coverage:ignore-start
  Map<String, dynamic> toJson() => _jsonSerializers.serializeWith(serializer, this)! as Map<String, dynamic>;
  // coverage:ignore-end
  static Serializer<NotificationsCapabilities> get serializer => _$notificationsCapabilitiesSerializer;
}

// coverage:ignore-start
final Serializers _serializers = (Serializers().toBuilder()
      ..add(NotificationsApiGenerateNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsApiGenerateNotificationResponseApplicationJson),
        NotificationsApiGenerateNotificationResponseApplicationJson.new,
      )
      ..add(NotificationsApiGenerateNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsApiGenerateNotificationResponseApplicationJson_Ocs),
        NotificationsApiGenerateNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsApiGenerateNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsOCSMeta), NotificationsOCSMeta.new)
      ..add(NotificationsOCSMeta.serializer)
      ..add(NotificationsEndpointListNotificationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointEndpointListNotificationsHeaders),
        NotificationsEndpointEndpointListNotificationsHeaders.new,
      )
      ..add(NotificationsEndpointEndpointListNotificationsHeaders.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointListNotificationsResponseApplicationJson),
        NotificationsEndpointListNotificationsResponseApplicationJson.new,
      )
      ..add(NotificationsEndpointListNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointListNotificationsResponseApplicationJson_Ocs),
        NotificationsEndpointListNotificationsResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsEndpointListNotificationsResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsNotification), NotificationsNotification.new)
      ..add(NotificationsNotification.serializer)
      ..addBuilderFactory(const FullType(NotificationsNotificationAction), NotificationsNotificationAction.new)
      ..add(NotificationsNotificationAction.serializer)
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NotificationsNotificationAction)]),
        ListBuilder<NotificationsNotificationAction>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltMap, [FullType(String), FullType(JsonObject)]),
        MapBuilder<String, JsonObject>.new,
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(NotificationsNotification)]),
        ListBuilder<NotificationsNotification>.new,
      )
      ..add(NotificationsEndpointDeleteAllNotificationsApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson),
        NotificationsEndpointDeleteAllNotificationsResponseApplicationJson.new,
      )
      ..add(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs),
        NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsEndpointDeleteAllNotificationsResponseApplicationJson_Ocs.serializer)
      ..add(NotificationsEndpointGetNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointGetNotificationResponseApplicationJson),
        NotificationsEndpointGetNotificationResponseApplicationJson.new,
      )
      ..add(NotificationsEndpointGetNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointGetNotificationResponseApplicationJson_Ocs),
        NotificationsEndpointGetNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsEndpointGetNotificationResponseApplicationJson_Ocs.serializer)
      ..add(NotificationsEndpointDeleteNotificationApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointDeleteNotificationResponseApplicationJson),
        NotificationsEndpointDeleteNotificationResponseApplicationJson.new,
      )
      ..add(NotificationsEndpointDeleteNotificationResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs),
        NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsEndpointDeleteNotificationResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(int)]), ListBuilder<int>.new)
      ..add(NotificationsEndpointConfirmIdsForUserApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointConfirmIdsForUserResponseApplicationJson),
        NotificationsEndpointConfirmIdsForUserResponseApplicationJson.new,
      )
      ..add(NotificationsEndpointConfirmIdsForUserResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs),
        NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsEndpointConfirmIdsForUserResponseApplicationJson_Ocs.serializer)
      ..add(NotificationsPushRegisterDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsPushRegisterDeviceResponseApplicationJson),
        NotificationsPushRegisterDeviceResponseApplicationJson.new,
      )
      ..add(NotificationsPushRegisterDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsPushRegisterDeviceResponseApplicationJson_Ocs),
        NotificationsPushRegisterDeviceResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsPushRegisterDeviceResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsPushDevice), NotificationsPushDevice.new)
      ..add(NotificationsPushDevice.serializer)
      ..add(NotificationsPushRemoveDeviceApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsPushRemoveDeviceResponseApplicationJson),
        NotificationsPushRemoveDeviceResponseApplicationJson.new,
      )
      ..add(NotificationsPushRemoveDeviceResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsPushRemoveDeviceResponseApplicationJson_Ocs),
        NotificationsPushRemoveDeviceResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsPushRemoveDeviceResponseApplicationJson_Ocs.serializer)
      ..add(NotificationsSettingsPersonalApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsSettingsPersonalResponseApplicationJson),
        NotificationsSettingsPersonalResponseApplicationJson.new,
      )
      ..add(NotificationsSettingsPersonalResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsSettingsPersonalResponseApplicationJson_Ocs),
        NotificationsSettingsPersonalResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsSettingsPersonalResponseApplicationJson_Ocs.serializer)
      ..add(NotificationsSettingsAdminApiVersion.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsSettingsAdminResponseApplicationJson),
        NotificationsSettingsAdminResponseApplicationJson.new,
      )
      ..add(NotificationsSettingsAdminResponseApplicationJson.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsSettingsAdminResponseApplicationJson_Ocs),
        NotificationsSettingsAdminResponseApplicationJson_Ocs.new,
      )
      ..add(NotificationsSettingsAdminResponseApplicationJson_Ocs.serializer)
      ..addBuilderFactory(const FullType(NotificationsCapabilities), NotificationsCapabilities.new)
      ..add(NotificationsCapabilities.serializer)
      ..addBuilderFactory(
        const FullType(NotificationsCapabilities_Notifications),
        NotificationsCapabilities_Notifications.new,
      )
      ..add(NotificationsCapabilities_Notifications.serializer)
      ..addBuilderFactory(const FullType(BuiltList, [FullType(String)]), ListBuilder<String>.new))
    .build();

Serializers get notificationsSerializers => _serializers;

final Serializers _jsonSerializers = (_serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..addPlugin(const ContentStringPlugin()))
    .build();

T deserializeNotifications<T>(final Object data) => _serializers.deserialize(data, specifiedType: FullType(T))! as T;

Object? serializeNotifications<T>(final T data) => _serializers.serialize(data, specifiedType: FullType(T));
// coverage:ignore-end
