import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: "title"),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                "assets/images/product_0.png", //image
                height: 130,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Long Sleeve sjhdjsd jshdj shjshd jsdh jshdjshdjsh jsh djshd jh",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "RM " + "56.20",
                    style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  size: 14,
                  color: Colors.black54,
                ),
                Expanded(
                    child: Text(
                  "Selangor",
                  style: TextStyle(
                      fontSize: 10, color: Colors.black54),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}