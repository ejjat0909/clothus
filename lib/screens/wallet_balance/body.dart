import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool isCard5Press = false;
  bool isCard10Press = false;
  bool isCard20Press = false;
  bool isCard30Press = false;
  bool isCard50Press = false;
  bool isCard100Press = false;
  Color hintColor = primaryColor.withOpacity(0.33);
  var topupController = TextEditingController();
  double balance = 89;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Available Balance",
                  style: TextStyle(
                    color: bgColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "RM ${balance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
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
                    topupCard(5, isPress: isCard5Press, press: () {
                      setState(() {
                        isCard5Press = true;
                        isCard10Press = false;
                        isCard20Press = false;
                        isCard30Press = false;
                        isCard50Press = false;
                        isCard100Press = false;
                        topupController.text = 5.toString();
                      });
                    }),
                    const SizedBox(width: 10),
                    topupCard(10, isPress: isCard10Press, press: () {
                      setState(() {
                        isCard5Press = false;
                        isCard10Press = true;
                        isCard20Press = false;
                        isCard30Press = false;
                        isCard50Press = false;
                        isCard100Press = false;
                        topupController.text = 10.toString();
                      });
                    }),
                    const SizedBox(width: 10),
                    topupCard(20, isPress: isCard20Press, press: () {
                      setState(() {
                        isCard5Press = false;
                        isCard10Press = false;
                        isCard20Press = true;
                        isCard30Press = false;
                        isCard50Press = false;
                        isCard100Press = false;
                        topupController.text = 20.toString();
                      });
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    topupCard(30, isPress: isCard30Press, press: () {
                      setState(() {
                        isCard5Press = false;
                        isCard10Press = false;
                        isCard20Press = false;
                        isCard30Press = true;
                        isCard50Press = false;
                        isCard100Press = false;
                        topupController.text = 30.toString();
                      });
                    }),
                    const SizedBox(width: 10),
                    topupCard(50, isPress: isCard50Press, press: () {
                      setState(() {
                        isCard5Press = false;
                        isCard10Press = false;
                        isCard20Press = false;
                        isCard30Press = false;
                        isCard50Press = true;
                        isCard100Press = false;
                        topupController.text = 50.toString();
                      });
                    }),
                    const SizedBox(width: 10),
                    topupCard(
                      100,
                      isPress: isCard100Press,
                      press: () {
                        setState(() {
                          isCard5Press = false;
                          isCard10Press = false;
                          isCard20Press = false;
                          isCard30Press = false;
                          isCard50Press = false;
                          isCard100Press = true;
                          topupController.text = 100.toString();
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.bottom,
                        onChanged: (value) {
                          if (value == 5.toString()) {
                            setState(() {
                              isCard5Press = true;
                              isCard50Press = false;
                            });
                          } else if (value == 10.toString()) {
                            setState(() {
                              isCard10Press = true;
                              isCard100Press = false;
                            });
                          } else if (value == 20.toString()) {
                            setState(() {
                              isCard20Press = true;
                            });
                          } else if (value == 30.toString()) {
                            setState(() {
                              isCard30Press = true;
                            });
                          } else if (value == 50.toString()) {
                            setState(() {
                              isCard50Press = true;
                              isCard5Press = false;
                            });
                          } else if (value == 100.toString()) {
                            setState(() {
                              isCard100Press = true;
                              isCard10Press = false;
                            });
                          } else {
                            setState(() {
                              isCard5Press = false;
                              isCard10Press = false;
                              isCard20Press = false;
                              isCard30Press = false;
                              isCard50Press = false;
                              isCard100Press = false;
                            });
                          }
                        },
                        onTap: () {},
                        showCursor: true,
                        controller: topupController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                          signed: true,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: primaryColor,
                        textAlign: TextAlign.start,
                        style: TextStyle(color: primaryColor, fontSize: 18),
                        decoration: const InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "RM ",
                              style:
                                  TextStyle(fontSize: 18, color: primaryColor),
                            ),
                          ),
                          prefixIconConstraints:
                              BoxConstraints(minWidth: 0, minHeight: 0),
                          // prefix: Text(
                          //   "RM ",
                          //   style: TextStyle(
                          //     color: primaryColor,
                          //   ),
                          // ),
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
                              borderSide: BorderSide(color: bgColor),
                              gapPadding: 10),
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            gapPadding: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
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
