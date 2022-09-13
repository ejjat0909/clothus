import 'package:clothus/constant.dart';
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
    );
  }
}
