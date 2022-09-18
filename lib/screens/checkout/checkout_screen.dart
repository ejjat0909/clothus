import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/screens/checkout/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckoutScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;
  const CheckoutScreen({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool isEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        leading: const BackButton(
          color: primaryColor,
        ),
      ),
      body: Body(
        image: widget.image,
        price: widget.price,
        title: widget.title,
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: bgColor),
        child: GestureDetector(
          onTap: isEnabled
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => MyHomePage(title: "checkout")),
                    ),
                  );
                }
              : null,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isEnabled ? primaryColor : Colors.grey[600],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: bgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
