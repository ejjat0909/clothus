import 'package:clothus/constant.dart';
import 'package:clothus/screens/list_transaction/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ListTransactionScreen extends StatefulWidget {
  const ListTransactionScreen({super.key});

  @override
  State<ListTransactionScreen> createState() => _ListTransactionScreenState();
}

class _ListTransactionScreenState extends State<ListTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
          leading:   BackButton(
            color: ColorConstant.primaryColor,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title:   Text(
            "List Transaction",
            style: TextStyle(color: ColorConstant.primaryColor),
          )),
          body: Body(),
    );
  }
}
