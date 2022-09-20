import 'package:clothus/components/input_decoration.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/screens/home_page/home_page_screen.dart';
import 'package:flutter/material.dart';

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
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: textFieldInputDecoration(
                                    "Email", "ex: izzat@ump.com"),
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                obscureText: true,
                                decoration:
                                    textFieldInputDecoration("Password", ""),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => HomePageScreen()),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                    color: ColorConstant.primaryColor,
                                    borderRadius: BorderRadius.circular(10),
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
  }
}
