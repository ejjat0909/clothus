import 'dart:convert';

import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/services/resource.dart';

class WalletResource {
  // Call Logout API to revoke the token
  static Resource topup() {
    return Resource(
        url: 'topup',
        parse: (response) {
          return DefaultResponseModel(json.decode(response.body));
        });
  }
}
