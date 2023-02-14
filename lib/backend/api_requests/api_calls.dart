import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LinkBageLoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? os = '',
    String? device = '',
    String? browser = '',
    String? location = '',
    String? time = '',
    String? connection = '',
    String? ip = '',
  }) {
    final body = '''
{
  "Username": "${username}",
  "OS": "${os}",
  "Device": "${device}",
  "Browser": "${browser}",
  "Location": "${location}",
  "Time": "${time}",
  "Connection": "${connection}",
  "IP": "${ip}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'link bage login ',
      apiUrl: 'https://100014.pythonanywhere.com/api/linkbased/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic sessionID(dynamic response) => getJsonField(
        response,
        r'''$.qrid''',
      );
}

class CreateRoomForDigitalQCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? qrid = '',
    String? product = 'DigitalQ',
  }) {
    final body = '''
{
  "user_name": "${username}",
  "qrid": "${qrid}",
  "product": "${product}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create room for digitalQ',
      apiUrl: 'http://100069.pythonanywhere.com/chat/create-room/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NearbyPlaceCall {
  static Future<ApiCallResponse> call({
    String? query = 'school',
    String? location = '6.5243793, 3.3792057',
    int? radius = 2000,
    String? key = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NearbyPlace',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/textsearch/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'query': query,
        'location': location,
        'radius': radius,
        'key': "AIzaSyCubgs2iI78Egk_mXEbr3gRHE69aGsy1d8",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic lat(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lat''',
        true,
      );
  static dynamic lng(dynamic response) => getJsonField(
        response,
        r'''$.results[:].geometry.location.lng''',
        true,
      );
  static dynamic placeID(dynamic response) => getJsonField(
        response,
        r'''$.results[:].place_id''',
        true,
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      );
}

class DirectionCall {
  static Future<ApiCallResponse> call({
    String? origin = '',
    String? destination = '',
    String? mode = '',
    String? waypoint = '',
    String? key = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Direction',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/directions/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DirectionDetailsCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Direction details',
      apiUrl: 'https://maps.googleapis.com/maps/api/place/details/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LogEventCall {
  static Future<ApiCallResponse> call({
    String? platformcode = '',
    String? citycode = '',
    String? daycode = '',
    String? dbcode = '',
    String? ipAddress = '',
    String? loginId = '',
    String? sessionId = '',
    String? processcode = '',
    String? regionalTime = '',
    String? dowellTime = '',
    String? location = '',
    String? objectcode = '',
    String? instancecode = '',
    String? context = '',
    String? documentId = '',
    String? rules = '',
    String? status = '',
  }) {
    final body = '''
{
  "platformcode": "${platformcode}",
  "citycode": "${citycode}",
  "daycode": "${daycode}",
  "dbcode": "${dbcode}",
  "ip_address": "${ipAddress}",
  "login_id": "${loginId}",
  "session_id": "${sessionId}",
  "processcode": "${processcode}",
  "regional_time": "${regionalTime}",
  "dowell_time": "${dowellTime}",
  "location": "${location}",
  "objectcode": "${objectcode}",
  "instancecode": "${instancecode}",
  "context": "${context}",
  "document_id": "${documentId}",
  "rules": "${rules}",
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Log Event',
      apiUrl: 'https://100003.pythonanywhere.com/event_creation',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic insertid(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
}

class DowellMapCall {
  static Future<ApiCallResponse> call({
    String? reqId = '',
    String? reqType = '',
    String? mongoId = '',
    String? eventId = '',
    String? dataTimeDone = '',
    String? userName = '',
    String? sessionId = '',
    String? locationDone = '',
    String? teamMemberID = '',
  }) {
    final body = '''
{
  "cluster": "dowellmap",
  "database": "dowellmap",
  "collection": "log",
  "document": "log",
  "team_member_ID": "${teamMemberID}",
  "function_ID": "ABCDE",
  "command": "insert",
  "field": {
    "req_type": "${reqType}",
    "req_id": "${reqId}",
    "mongo_id": "${mongoId}",
    "data_time_done": "${dataTimeDone}",
    "eventId": "${eventId}",
    "user_name": "${userName}",
    "session_id": "${sessionId}",
    "location_done": "${locationDone}"
  },
  "update_field": {
    "order_nos": 1
  },
  "platform": "bangalore"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Dowell Map',
      apiUrl: 'http://100002.pythonanywhere.com/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.isSuccess''',
      );
  static dynamic insertID(dynamic response) => getJsonField(
        response,
        r'''$.inserted_id''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
