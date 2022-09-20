import 'dart:convert';

import 'package:clothus/models/checkout_request_model.dart';
import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/services/resource.dart';

class CheckoutResource {
  // Call Logout API to revoke the token
  static Resource checkout(CheckoutRequestModel checkoutRequestModel) {
    return Resource(
        url: 'checkout',
        data: checkoutRequestModel.toJson(),
        parse: (response) {
          return DefaultResponseModel(json.decode(response.body));
        });
  }
}
