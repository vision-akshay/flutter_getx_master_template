import '../../utils/api_endpoints.dart';
import '../api_common_service/api_request.dart';

class LoginRequest extends RemoteRequest {
  LoginRequest({required Map<String, dynamic> request}) {
    initialize(request);
  }

  void initialize(Map<String, dynamic> request) {
    url = "$baseURL$endpointLogin";
    requestBody = request;
    type = APIRequestType.post;
  }
}
