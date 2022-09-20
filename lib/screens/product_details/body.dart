import 'package:clothus/components/color_dot.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/models/product/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          productModel.image!,
          height: MediaQuery.of(context).size.height * 0.4, //40percent
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: ColorConstant.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    productModel.title!,
                    style: TextStyle(
                        color: ColorConstant.primaryColor, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "RM ${productModel.price!}",
                    style: TextStyle(
                        color: ColorConstant.primaryColor, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Colors",
                    style: TextStyle(
                        color: ColorConstant.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ColorDot(
                        color: Colors.green,
                        press: () {},
                      ),
                      ColorDot(
                        color: Colors.black,
                        isActive: true,
                        press: () {},
                      ),
                      ColorDot(
                        color: Colors.yellow,
                        press: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
