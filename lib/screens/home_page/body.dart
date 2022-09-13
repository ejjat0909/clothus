import 'dart:math';

import 'package:clothus/components/product_card.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../product_details/product_details_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> products = [
    Product(
      image: "assets/images/product_0.png",
      title: "Long Sleeve Shirts",
      price: 165,
      bgColor: const Color(0xFFFEFBF9),
    ),
    Product(
        image: "assets/images/product_1.png",
        title: "Casual Henley Shirts",
        price: 99,
        bgColor: Colors.brown),
    Product(
      image: "assets/images/product_2.png",
      title: "Curved Hem Shirts",
      price: 180,
      bgColor: const Color(0xFFF8FEFB),
    ),
    Product(
      image: "assets/images/product_3.png",
      title: "Casual Nolin",
      price: 149,
      bgColor: const Color(0xFFEEEEED),
    ),
    Product(
      image: "assets/images/product_0.png",
      title: "Long Sleeve Shirts",
      price: 165,
      bgColor: const Color(0xFFFEFBF9),
    ),
    Product(
        image: "assets/images/product_1.png",
        title: "Casual Henley Shirts",
        price: 99,
        bgColor: Colors.brown),
    Product(
      image: "assets/images/product_2.png",
      title: "Curved Hem Shirts",
      price: 180,
      bgColor: const Color(0xFFF8FEFB),
      location: "Kedah",
    ),
    Product(
      image: "assets/images/product_3.png",
      title: "Casual Nolin",
      price: 149,
      bgColor: const Color(0xFFEEEEED),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              image: products[index].image,
              title: products[index].title,
              location: products[index].location,
              price: products[index].price,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      title: products[index].title,
                      image: products[index].image,
                      price: products[index].price,
                      
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
