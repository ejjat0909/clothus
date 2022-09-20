import 'package:clothus/components/input_decoration.dart';
import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Body extends StatefulWidget {
  final String title;
  final double price;
  final String image;

  const Body({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late double merchTotal;
  double balance = 89.00;
  double shipTotal = 0;
  double shipping = 4.50;
  double itemTotal = 0;
  bool isPress = false;

  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _quantityController.text = "1";
    merchTotal = widget.price;
    itemTotal = shipTotal + merchTotal;
    shipTotal = shipping;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: const Offset(4, 4),
                      ),
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.fitWidth,
                        height: 100,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text("RM ${widget.price.toStringAsFixed(2)}"),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: quantitySection(),
                            ),
                            const Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _nameController,
                  onChanged: ((value) {
                    value = _nameController.text;
                  }),
                  decoration:
                      textFieldInputDecoration("Name", "ex: Hakimi Hamdan"),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: _addressController,
                  onChanged: ((value) {
                    value = _addressController.text;
                  }),
                  decoration:
                      textFieldInputDecoration("Address", "ex: Taman UMP 15"),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.payments_rounded,
                      color: primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Wallet Balance (RM ${balance.toStringAsFixed(2)})",
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              orderSummary(),
            ],
          ),
        ),
      ),
    );
  }

  Container orderSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Summary",
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Merchandise Subtotal",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "RM ${merchTotal.toStringAsFixed(2)}",
                  style: const TextStyle(color: primaryColor, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Shipping Subtotal",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "RM ${shipTotal.toStringAsFixed(2)}",
                  style: const TextStyle(color: primaryColor, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Expanded(
                flex: 3,
                child: Text(
                  "Total",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "RM ${itemTotal.toStringAsFixed(2)}",
                  style: const TextStyle(
                    color: primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row quantitySection() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            if (_quantityController.text == "") {
              _quantityController.text == "0";
            }
            int currentQuantity = int.parse(_quantityController.text);
            if (currentQuantity > 0) {
              setState(() {
                isPress = true;
                currentQuantity--;
                _quantityController.text =
                    (currentQuantity > 0 ? currentQuantity : 0).toString();

                merchTotal =
                    merchTotal < 0 ? 0 : currentQuantity * widget.price;

                shipTotal = currentQuantity > 0 ? shipping : 0;

                itemTotal = merchTotal + shipTotal;
              });

              if (balance >= itemTotal) {
                setState(() {});
              }
            }
          },
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor,
              ),
            ),
            child: const Icon(
              Icons.remove,
              color: primaryColor,
              size: 20,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            onChanged: (value) {
              setState(() {
                merchTotal = int.parse(value) * widget.price;
                shipTotal = int.parse(value) > 0 ? shipping : 0;
                itemTotal = merchTotal + shipTotal;
              });
            },
            onTap: () {
              setState(() {
                isPress = !isPress;
              });
            },
            showCursor: isPress,
            controller: _quantityController,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            cursorColor: primaryColor,
            textAlign: TextAlign.center,
            style: TextStyle(color: primaryColor, fontSize: 14),
            decoration: const InputDecoration(
              isDense: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  gapPadding: 10),
              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                gapPadding: 0,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (_quantityController.text == "") {
              _quantityController.text == "0";
            }
            int currentQuantity = int.parse(_quantityController.text);

            setState(() {
              isPress = true;
              currentQuantity++;
              _quantityController.text = (currentQuantity).toString();
              merchTotal = currentQuantity * widget.price;
              shipTotal = currentQuantity > 0 ? shipping : 0;
              itemTotal = merchTotal + shipTotal;
            });
          },
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: primaryColor,
              ),
            ),
            child: Icon(
              Icons.add,
              color: primaryColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
