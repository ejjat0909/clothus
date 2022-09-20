import 'dart:convert';

import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/models/user_response_model.dart';
import 'package:clothus/services/resource.dart';

class UserResource {
  // Call Logout API to revoke the token
  static Resource logout() {
    return Resource(
        url: 'logout',
        parse: (response) {
          return DefaultResponseModel(json.decode(response.body));
        });
  }

  // Call Login API
  static Resource login(String email, String password) {
    return Resource(
        url: 'login',
        data: {'email': email, 'password': password},
        parse: (response) {
          return UserResponseModel(json.decode(response.body));
        });
  }
}
