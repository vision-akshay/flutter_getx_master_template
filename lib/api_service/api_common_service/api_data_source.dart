import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'api_request.dart';

class ApiDataSource {
  static final ApiDataSource _singleton = ApiDataSource._internal();

  factory ApiDataSource() {
    return _singleton;
  }

  ApiDataSource._internal();

  Future<APIResult> makeRequest(RemoteRequest request) async {
    final Map<String, String> headers = {'Content-Type': 'application/json'};
    Duration timeout = request.timeout ?? const Duration(seconds: 100);

    APIResult result = APIResult();
    log('api call----->${request.url}');
    if (request.headers != null && request.headers.isNotEmpty) {
      headers.addAll(request.headers);
    }
    final Encoding? encoding = Encoding.getByName('utf-8');
    http.Response? response;

    if (request.type == APIRequestType.get) {
      response = await http
          .get(
            Uri.parse(request.url),
            headers: headers,
          )
          .timeout(timeout);
    } else if (request.type == APIRequestType.post) {
      response = await http
          .post(
            Uri.parse(request.url),
            headers: headers,
            body: request.requestBody != null
                ? json.encode(request.requestBody)
                : null,
            encoding: encoding,
          )
          .timeout(timeout);
    } else if (request.type == APIRequestType.put) {
      response = await http
          .put(
            Uri.parse(request.url),
            headers: headers,
            body: request.requestBody != null
                ? json.encode(request.requestBody)
                : null,
            encoding: encoding,
          )
          .timeout(timeout);
    }
    if (response?.statusCode == 200) {
      result.data = json.decode(utf8.decode(response!.bodyBytes));
    }
    result.statusCode = response?.statusCode;

    return result;
  }
}

class APIResult {
  dynamic data;
  late int? statusCode;
}
