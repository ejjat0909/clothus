import 'package:clothus/components/color_dot.dart';
import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.image,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String title;
  final double price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          image,
          height: MediaQuery.of(context).size.height * 0.4, //40percent
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
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
                    title,
                    style: const TextStyle(color: primaryColor, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "RM ${price.toStringAsFixed(2)}",
                    style: const TextStyle(color: primaryColor, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Colors",
                    style: TextStyle(
                        color: primaryColor,
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
