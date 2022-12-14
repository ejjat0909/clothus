import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/screens/list_transaction/list_transaction_screen.dart';
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
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        leading:   BackButton(
          color: ColorConstant.primaryColor,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ListTransactionScreen()),
                  ),
                );
              },
              icon:   Icon(
                Icons.history,
                color: ColorConstant.primaryColor,
                size: 30,
              ))
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title:   Text(
          "Wallet",
          style: TextStyle(
            color: ColorConstant.primaryColor,
          ),
        ),
      ),
      body: Body(),
    );
  }
}
