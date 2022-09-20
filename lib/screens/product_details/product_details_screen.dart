import 'package:clothus/constant.dart';
import 'package:clothus/screens/checkout/checkout_screen.dart';
import 'package:clothus/screens/product_details/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String title;
  final double price;
  final String image;
  const ProductDetailsScreen(
      {super.key,
      required this.title,
      required this.price,
      required this.image});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading:   BackButton(
          color: ColorConstant.primaryColor,
        ),
      ),
      body: Body(
        image: widget.image,
        title: widget.title,
        price: widget.price,
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: ColorConstant.white),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => CheckoutScreen(
                      title: widget.title,
                      price: widget.price,
                      image: widget.image,
                    )),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child:   Center(
              child: Text(
                "Buy Now",
                style: TextStyle(
                  color: ColorConstant.bgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
