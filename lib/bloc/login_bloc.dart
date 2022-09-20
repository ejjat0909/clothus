import 'package:clothus/helpers/http_response.dart';
import 'package:clothus/helpers/secure_shared_preferences.dart';
import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/models/user/login_request_model.dart';
import 'package:clothus/models/user/user_response_model.dart';
import 'package:clothus/resource/user_resource.dart';
import 'package:clothus/services/web_services.dart';

class LoginBloc {
  Future<DefaultResponseModel> logout() async {
    // Revoked User Token
    return await Webservice.get(UserResource.logout());
  }

  Future<UserResponseModel> login(LoginRequestModel loginModel) async {
    // Call the API to login
    return await Webservice.post(UserResource.login(loginModel));
  }
}
