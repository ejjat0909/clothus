import 'package:clothus/constant.dart';
import 'package:clothus/models/product/product_model.dart';
import 'package:clothus/screens/checkout/checkout_screen.dart';
import 'package:clothus/screens/product_details/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({super.key, required this.productModel});

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
        leading: BackButton(
          color: ColorConstant.primaryColor,
        ),
      ),
      body: Body(
        productModel: widget.productModel,
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
                      productModel: widget.productModel,
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
            child: Center(
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
