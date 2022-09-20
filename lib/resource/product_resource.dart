import 'dart:convert';

import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/models/product/product_list_response_model.dart';
import 'package:clothus/models/user/login_request_model.dart';
import 'package:clothus/models/user/user_model.dart';
import 'package:clothus/models/user/user_response_model.dart';
import 'package:clothus/services/resource.dart';

class ProductResource {
  // Call Logout API to revoke the token
  static Resource getProductsList() {
    return Resource(
        url: 'product',
        parse: (response) {
          return ProductListResponseModel(json.decode(response.body));
        });
  }
}
