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
                decoration:   BoxDecoration(
                  color: ColorConstant.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        "One Time Top Up",
                        style: TextStyle(
                          color: ColorConstant.primaryColor,
                        ),
                      ),
                    ),
                    Divider(
                      color: ColorConstant.primaryColor,
                      height: 0,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration:   BoxDecoration(
                  color: ColorConstant.white,
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
                    color: ColorConstant.primaryColor,
                  ),
                  child:   Center(
                    child: Text(
                      "Topup Now",
                      style: TextStyle(
                        color: ColorConstant.white,
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
        color: ColorConstant.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children:   [
              Icon(
                Icons.payments_rounded,
                color: ColorConstant.primaryColor,
                size: 18,
              ),
              SizedBox(width: 5),
              Text(
                "Payment Gateway",
                style: TextStyle(
                  color: ColorConstant.primaryColor,
                  fontSize: 12,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          RichText(
            text:   TextSpan(
              text: "toyyib",
              style: TextStyle(
                color: ColorConstant.toyyibPay,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              children: [
                TextSpan(
                  text: "Pay",
                  style: TextStyle(
                    color: ColorConstant.toyyibPay,
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
            children:   [
              Text(
                'Total Top Up',
                style: TextStyle(
                  color: ColorConstant.primaryColor,
                ),
              ),
              Text(
                "RM 0.00",
                style: TextStyle(
                  color: ColorConstant.primaryColor,
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
          
            cursorColor: ColorConstant.primaryColor,
            textAlign: TextAlign.start,
            style:   TextStyle(color: ColorConstant.primaryColor, fontSize: 18),
            decoration:   InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "RM ",
                  style: TextStyle(fontSize: 18, color: ColorConstant.primaryColor),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
              hintText: "Input Amount",
              hintStyle: TextStyle(
                fontSize: 18,
              ),
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorConstant.bgColor),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConstant.bgColor), gapPadding: 10),
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
        color: ColorConstant.toyyibPay,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Text(
                "Available Balance",
                style: TextStyle(
                  color: ColorConstant.bgColor,
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
            style:   TextStyle(
              color: ColorConstant.bgColor,
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
            color: ColorConstant.bgColor,
            border: Border.all(
              color: isPress ? ColorConstant.primaryColor : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "RM ${total.toString()}",
              style:   TextStyle(
                color: ColorConstant.primaryColor,
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
