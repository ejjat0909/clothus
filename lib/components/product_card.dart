import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/screens/product_details/product_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String image, title, location;
  final double price;
  final Function() press;
  const ProductCard({
    Key? key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5.0),
          //border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                image, //image
                height: 130,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "RM ${price.toStringAsFixed(2)}",
                    style: const TextStyle(
                        color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.black54,
                ),
                Expanded(
                    child: Text(
                  location,
                  style: const TextStyle(fontSize: 10, color: Colors.black54),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
