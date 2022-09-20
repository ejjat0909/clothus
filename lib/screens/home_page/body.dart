import 'dart:math';

import 'package:clothus/bloc/product_bloc.dart';
import 'package:clothus/components/product_card.dart';
import 'package:clothus/constant.dart';
import 'package:clothus/main.dart';
import 'package:clothus/models/product/product_list_response_model.dart';
import 'package:clothus/models/product/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../product_details/product_details_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: FutureBuilder<ProductListResponseModel>(
            future: getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isSuccess) {
                  List<ProductModel> products = snapshot.data!.data!;
                  return GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      ProductModel productModel = products[index];
                      return ProductCard(
                        image: productModel.image!,
                        title: productModel.title!,
                        price: productModel.price!,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                productModel: productModel,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text("Something went wrong."),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Future<ProductListResponseModel>? getProducts() async {
    ProductBloc productBloc = ProductBloc();
    try {
      // Call API to Login
      return await productBloc.getListProducts();
    } catch (e) {
      print(e);
    }

    return ProductListResponseModel({'': ''});
  }
}
