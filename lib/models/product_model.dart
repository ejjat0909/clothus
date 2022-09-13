import 'package:flutter/material.dart';

class Product {
  final String image, title, location;
  final double price;
  final Color bgColor;

  Product({
    required this.image,
    required this.bgColor,
    required this.price,
    required this.title,
    this.location = "Selangor",
  });
}




