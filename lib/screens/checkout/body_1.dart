import 'package:clothus/components/input_decoration.dart';
import 'package:clothus/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

//step 1 : design only
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
                    color: ColorConstant.white,
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
                          style: TextStyle(
                            color: ColorConstant.primaryColor,
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
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                
                  decoration:
                      textFieldInputDecoration("Name", "ex: Hakimi Hamdan"),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                 
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
                  color: ColorConstant.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                     Icon(
                      Icons.payments_rounded,
                      color: ColorConstant.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Wallet Balance (RM ${0.toStringAsFixed(2)})",
                      style:  TextStyle(
                        color: ColorConstant.primaryColor,
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
        color: ColorConstant.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            "Order Summary",
            style: TextStyle(
              color: ColorConstant.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
               Expanded(
                flex: 3,
                child: Text(
                  "Merchandise Subtotal",
                  style: TextStyle(
                    color: ColorConstant.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "RM ${0.toStringAsFixed(2)}",
                  style:  TextStyle(color: ColorConstant.primaryColor, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
               Expanded(
                flex: 3,
                child: Text(
                  "Shipping Subtotal",
                  style: TextStyle(
                    color: ColorConstant.primaryColor,
                    fontSize: 12,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  "RM ${0.toStringAsFixed(2)}",
                  style:  TextStyle(color: ColorConstant.primaryColor, fontSize: 12),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
               Expanded(
                flex: 3,
                child: Text(
                  "Total",
                  style: TextStyle(
                    color: ColorConstant.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  "RM ${0.toStringAsFixed(2)}",
                  style:  TextStyle(
                    color: ColorConstant.primaryColor,
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
          
          },
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstant.primaryColor,
              ),
            ),
            child:  Icon(
              Icons.remove,
              color: ColorConstant.primaryColor,
              size: 20,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            onChanged: (value) {
             
            },
            onTap: () {
            
            },
            showCursor: true,
           
            keyboardType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: true,
            ),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            cursorColor: ColorConstant.primaryColor,
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorConstant.primaryColor, fontSize: 14),
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
          },
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorConstant.primaryColor,
              ),
            ),
            child: Icon(
              Icons.add,
              color: ColorConstant.primaryColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
