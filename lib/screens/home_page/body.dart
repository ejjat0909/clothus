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
  List<ProductModel> products = [
    ProductModel(
      image: "assets/images/product_0.png",
      title: "Long Sleeve Shirts",
      price: 165,
    ),
    ProductModel(
      image: "assets/images/product_1.png",
      title: "Casual Henley Shirts",
      price: 99,
    ),
    ProductModel(
      image: "assets/images/product_2.png",
      title: "Curved Hem Shirts",
      price: 180,
    ),
    ProductModel(
      image: "assets/images/product_3.png",
      title: "Casual Nolin",
      price: 149,
    ),
    ProductModel(
      image: "assets/images/product_0.png",
      title: "Long Sleeve Shirts",
      price: 165,
    ),
    ProductModel(
      image: "assets/images/product_1.png",
      title: "Casual Henley Shirts",
      price: 99,
    ),
    ProductModel(
      image: "assets/images/product_2.png",
      title: "Curved Hem Shirts",
      price: 180,
    ),
    ProductModel(
      image: "assets/images/product_3.png",
      title: "Casual Nolin",
      price: 149,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              image:
                  "https://e7.pngegg.com/pngimages/850/755/png-clipart-toddlers-brown-and-white-bear-footie-pajama-infant-clothing-infant-clothing-romper-suit-childrens-clothing-product-kind-baby-clothes-baby-announcement-card-child-thumbnail.png",
              title: products[index].title!,
              price: products[index].price!,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(
                      title: products[index].title!,
                      image:
                          "https://e7.pngegg.com/pngimages/850/755/png-clipart-toddlers-brown-and-white-bear-footie-pajama-infant-clothing-infant-clothing-romper-suit-childrens-clothing-product-kind-baby-clothes-baby-announcement-card-child-thumbnail.png",
                      price: products[index].price!,
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
