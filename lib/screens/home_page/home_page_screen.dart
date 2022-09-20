import 'package:clothus/constant.dart';
import 'package:clothus/screens/home_page/body.dart';
import 'package:clothus/screens/sign_in/sign_in_screen.dart';
import 'package:clothus/screens/wallet_balance/wallet_balance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.logout_outlined,
            color: ColorConstant.primaryColor,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => WalletBalanceScreen()),
                ),
              );
            },
            icon: Icon(
              Icons.payments_outlined,
              color: ColorConstant.primaryColor,
              size: 30,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "ClothUs",
          style: TextStyle(color: ColorConstant.primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
