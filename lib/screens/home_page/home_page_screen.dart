import 'package:clothus/constant.dart';
import 'package:clothus/screens/home_page/body.dart';
import 'package:clothus/screens/sign_in/sign_in_screen.dart';
import 'package:clothus/screens/wallet_balance/wallet_balance_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageScreen extends StatefulWidget {
  final String title;
  const HomePageScreen({super.key, required this.title});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: primaryColor,
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
            icon: const Icon(
              Icons.payments_outlined,
              color: primaryColor,
              size: 30,
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
