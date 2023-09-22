import '../../utils/api_endpoints.dart';
import '../api_common_service/api_request.dart';

class SignupRequest extends RemoteRequest {
  SignupRequest({required Map<String, dynamic> request}) {
    initialize(request);
  }

  void initialize(Map<String, dynamic> request) {
    url = "$baseURL$endPointSignup";
    requestBody = request;
    type = APIRequestType.post;
  }
}
