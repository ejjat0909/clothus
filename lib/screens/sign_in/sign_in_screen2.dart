import 'package:clothus/components/input_decoration.dart';
import 'package:clothus/components/loading_dialog.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/form_bloc/login_form_bloc.dart';
import 'package:clothus/screens/home_page/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

// Step 1: Design only
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) => LoginFormBloc(),
        child: Builder(builder: (context) {
          final loginFormBloc = context.read<LoginFormBloc>();
          return FormBlocListener<LoginFormBloc, String, String>(
            onSubmitting: ((context, state) {
              LoadingDialog.show(context);
            }),
            onSubmissionFailed: (context, state) {
              LoadingDialog.hide(context);
            },
            onSuccess: (context, state) {
              LoadingDialog.hide(context);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePageScreen()));
            },
            onFailure: (context, state) {
              LoadingDialog.hide(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureResponse!)));
            },
            child: Container(
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
                                child: Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      textFieldBloc: loginFormBloc.email,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: textFieldInputDecoration(
                                          "Email", "ex: izzat@ump.com"),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: loginFormBloc.password,
                                      decoration: textFieldInputDecoration(
                                          "Password", ""),
                                    ),
                                    const SizedBox(height: 20),
                                    GestureDetector(
                                      onTap: () {
                                        loginFormBloc.submit();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: ColorConstant.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                              color: ColorConstant.bgColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
        }),
      ),
    );
  }
}
