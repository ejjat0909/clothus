import 'package:clothus/components/decimal_text_input.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// step 1: design onlyy
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // widget for wrap the child to to have border radius
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        // widget for scrolling
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              balanceCard(context),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        "One Time Top Up",
                        style: TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                    Divider(
                      color: primaryColor,
                      height: 0,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        topupCard(5),
                        const SizedBox(width: 10),
                        topupCard(10),
                        const SizedBox(width: 10),
                        topupCard(20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        topupCard(30),
                        const SizedBox(width: 10),
                        topupCard(50),
                        const SizedBox(width: 10),
                        topupCard(100),
                      ],
                    ),
                    const SizedBox(height: 10),
                    amountInput(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // payment gateway
              paymentGateway(),
              const SizedBox(height: 25),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primaryColor,
                  ),
                  child: const Center(
                    child: Text(
                      "Topup Now",
                      style: TextStyle(
                        color: white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentGateway() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.payments_rounded,
                color: primaryColor,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                "Payment Gateway",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          RichText(
            text: const TextSpan(
              text: "toyyib",
              style: TextStyle(
                color: toyyibPay,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: "Pay",
                  style: TextStyle(
                    color: toyyibPay,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Total Top Up',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              Text(
                "RM 0.00",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

// textfield to enter RM amount
  Widget amountInput() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 14 * 4),
            textAlignVertical: TextAlignVertical.bottom,
            onChanged: (value) {},
            onTap: () {},
            showCursor: true,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
              signed: true,
            ),
          
            cursorColor: primaryColor,
            textAlign: TextAlign.start,
            style: const TextStyle(color: primaryColor, fontSize: 18),
            decoration: const InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "RM ",
                  style: TextStyle(fontSize: 18, color: primaryColor),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              hintText: "Input Amount",
              hintStyle: TextStyle(
                fontSize: 18,
              ),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: bgColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: bgColor), gapPadding: 10),
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container balanceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: toyyibPay,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Available Balance",
                style: TextStyle(
                  color: bgColor,
                  fontSize: 14,
                ),
              ),
              Image.asset(
                "assets/images/toyyiblogo.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.07,
              )
            ],
          ),
          const SizedBox(height: 25),
          Text(
            "RM ${0.toStringAsFixed(2)}",
            style: const TextStyle(
              color: bgColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),
          RichText(
            text: const TextSpan(
              text: "toyyib",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: "Pay",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget topupCard(int total, {bool isPress = false, Function()? press}) {
    return Expanded(
      flex: 2,
      child: GestureDetector(
        onTap: press,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: isPress ? primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "RM ${total.toString()}",
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
