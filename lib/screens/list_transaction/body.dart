import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            ListTransactionCard(
              status: true,
            ),
            ListTransactionCard(
              status: false,
            ),
          ],
        ),
      ),
    );
  }
}

class ListTransactionCard extends StatelessWidget {
  final bool status; // true = add wallet balance, false = buy from shop
  const ListTransactionCard({
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: white,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: primaryColor,
            ),
            child: Center(
              child: Icon(
                status ? Icons.add_card_rounded : Icons.shopping_bag_outlined,
                color: white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            children: [
              Text(
                status
                    ? "Wallet Topup (RM ${100.toStringAsFixed(2)})"
                    : "Shopping (RM ${99.toStringAsFixed(2)})",
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
