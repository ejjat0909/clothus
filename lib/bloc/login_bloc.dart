import 'package:clothus/helpers/http_response.dart';
import 'package:clothus/helpers/secure_shared_preferences.dart';
import 'package:clothus/models/user_response_model.dart';
import 'package:clothus/resource/user_resource.dart';
import 'package:clothus/screens/sign_in/sign_in_screen.dart';
import 'package:clothus/services/web_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBloc {
  void signOut(context) async {
    // Revoked User Token
    await Webservice.get(UserResource.logout());

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: ((context) => SignInScreen()),
        ),
        (Route<dynamic> route) => false);
  }

  Future<UserResponseModel> login(String email, String password) async {
    // Call the API to login
    return await Webservice.post(UserResource.login(email, password));
  }
}
