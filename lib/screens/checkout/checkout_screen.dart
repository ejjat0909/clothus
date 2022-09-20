import 'package:clothus/bloc/checkout.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/models/checkout_request_model.dart';
import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/models/product/product_model.dart';
import 'package:clothus/screens/checkout/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckoutScreen extends StatefulWidget {
  final ProductModel productModel;
  const CheckoutScreen({
    super.key,
    required this.productModel,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Checkout",
          style: TextStyle(
            color: ColorConstant.primaryColor,
          ),
        ),
        leading: BackButton(
          color: ColorConstant.primaryColor,
        ),
      ),
      body: Body(
        productModel: widget.productModel,
        addressController: addressController,
        nameController: nameController,
        quantityController: quantityController,
      ),
      bottomNavigationBar: Container(
        height: 75,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: ColorConstant.bgColor),
        child: GestureDetector(
          onTap: () async {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: ((context) => MyHomePage(title: "checkout")),
            //   ),
            // );

            CheckoutRequestModel checkoutRequestModel = CheckoutRequestModel(
              name: nameController.value.text,
              quantity: int.parse(quantityController.value.text),
              address: addressController.value.text,
              productId: widget.productModel.id,
            );

            CheckoutBloc checkoutBloc = CheckoutBloc();
            DefaultResponseModel responseModel =
                await checkoutBloc.checkout(checkoutRequestModel);

            if (responseModel.isSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Succesfully Checkout")));
            } else {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(responseModel.message)));
            }
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorConstant.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                "Checkout",
                style: TextStyle(
                  color: ColorConstant.bgColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
