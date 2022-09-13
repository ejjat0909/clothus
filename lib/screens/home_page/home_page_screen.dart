import 'package:clothus/constant.dart';
import 'package:clothus/screens/home_page/body.dart';
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.diamond_outlined,
                color: primaryColor,
                size: 30,
              ))
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
