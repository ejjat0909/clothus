import 'package:clothus/constant.dart';
import 'package:clothus/screens/wallet_balance/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WalletBalanceScreen extends StatefulWidget {
  const WalletBalanceScreen({super.key});

  @override
  State<WalletBalanceScreen> createState() => _WalletBalanceScreenState();
}

class _WalletBalanceScreenState extends State<WalletBalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: const BackButton(
          color: primaryColor,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Wallet",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}