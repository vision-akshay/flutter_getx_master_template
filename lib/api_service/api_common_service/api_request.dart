import 'dart:io';

enum APIRequestType { get, post, multipart, put }



class RemoteRequest {
  late String url;
  late Map<String, dynamic> requestBody;
  late APIRequestType type;
  late Map<String, String> headers = {'Content-Type': 'application/json'};
  late File file;
  Duration? timeout;
}
