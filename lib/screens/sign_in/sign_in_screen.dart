import 'package:clothus/bloc/login_bloc.dart';
import 'package:clothus/components/input_decoration.dart';
import 'package:clothus/components/loading_dialog.dart';
import 'package:clothus/components/primary_button.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/form_bloc/login_form_bloc.dart';
import 'package:clothus/helpers/shared_preferences.dart';
import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/models/user/login_request_model.dart';
import 'package:clothus/models/user/user_response_model.dart';
import 'package:clothus/screens/home_page/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Step 1: Design only
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginBloc loginBloc = LoginBloc();
  LoginRequestModel _loginRequestModel = LoginRequestModel();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                text: "Cloth",
                style: TextStyle(
                  color: ColorConstant.primaryColor,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: 60,
                ),
                children: [
                  TextSpan(
                    text: "Us",
                    style: TextStyle(
                      color: ColorConstant.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Title
            Text(
              "Welcome back to Clothus, \n You've been missed",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorConstant.primaryColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 50),
            // Form Card
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: "test@example.com",
                                onSaved: (value) {
                                  _loginRequestModel.email = value;
                                },
                                // controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: textFieldInputDecoration(
                                    "Email", "ex: izzat@ump.com"),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                initialValue: "password",
                                onSaved: (value) {
                                  _loginRequestModel.password = value;
                                },
                                //controller: passwordController,
                                obscureText: true,
                                decoration:
                                    textFieldInputDecoration("Password", ""),
                              ),
                              const SizedBox(height: 20),
                              PrimaryButton(
                                  text: "Sign In",
                                  color: ColorConstant.primaryColor,
                                  press: () {
                                    if (validateAndSave()) {
                                      loginProcess(_loginRequestModel);
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginProcess(LoginRequestModel loginModel) async {
    LoadingDialog.show(context);
    UserResponseModel responseModel = await loginBloc.login(loginModel);

    LoadingDialog.hide(context);

    if (responseModel.isSuccess) {
      // Save access_token
      //await SharedPref.save("access_token", responseModel.data!.accessToken!,);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("access_token", responseModel.data!.accessToken!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => HomePageScreen()),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(responseModel.message)));
    }
  }

  bool validateAndSave() {
    final form = _formKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }

    return false;
  }
}
