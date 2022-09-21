import 'dart:convert';

import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/services/resource.dart';

class WalletResource {
  // Call Logout API to revoke the token
  static Resource topup(String amount) {
    return Resource(
        url: 'topup',
        data: {"amount": amount},
        parse: (response) {
          return DefaultResponseModel(json.decode(response.body));
        });
  }

  static Resource getWalletBalance() {
    return Resource(
        url: 'wallet-balance',
        parse: (response) {
          return DefaultResponseModel(json.decode(response.body));
        });
  }
}
