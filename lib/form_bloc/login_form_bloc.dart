import 'package:clothus/bloc/login_bloc.dart';

import 'package:clothus/models/user/login_request_model.dart';
import 'package:clothus/models/user/user_model.dart';
import 'package:clothus/models/user/user_response_model.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LoginFormBloc extends FormBloc<String, String> {
  // Initialize Bloc
  final LoginBloc loginBloc = LoginBloc();

  // For email field
  final email = TextFieldBloc(
    initialValue: "test@example.com",
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  // For password field
  final password = TextFieldBloc(
    initialValue: "password",
    validators: [
      FieldBlocValidators.required,
    ],
  );

  // Constructor, to add the field variable to the form
  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
  }

  // Handle what happen on submit
  @override
  void onSubmitting() async {
    try {
      // Call API to Login
      UserResponseModel userResponseModel = await loginBloc.login(
          LoginRequestModel(email: email.value, password: password.value));

      // Handle API response
      if (userResponseModel.isSuccess &&
          userResponseModel.data!.accessToken != null) {
        // Save access_token
        // await SecureSharedPreferences.write(
        //     key: "access_token", value: userResponseModel.data!.accessToken!);
        // Trigger success event
        emitSuccess();
      } else {
        // Trigger fail event
        emitFailure(failureResponse: userResponseModel.message);
      }
    } catch (e) {
      // Trigger fail event
      emitFailure(failureResponse: e.toString());
    }
  }
}
