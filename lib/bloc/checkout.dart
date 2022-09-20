import 'package:clothus/models/checkout_request_model.dart';
import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/resource/checkout.dart';
import 'package:clothus/resource/wallet_resource.dart';
import 'package:clothus/services/web_services.dart';

class CheckoutBloc {
  Future<DefaultResponseModel> checkout(
      CheckoutRequestModel checkoutRequestModel) async {
    // Revoked User Token
    return await Webservice.get(
        CheckoutResource.checkout(checkoutRequestModel));
  }
}
