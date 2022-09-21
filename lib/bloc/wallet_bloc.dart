import 'package:clothus/models/default_response_model.dart';
import 'package:clothus/resource/wallet_resource.dart';
import 'package:clothus/services/web_services.dart';

class WalletBloc {
  Future<DefaultResponseModel> topup(String amount) async {
    // Revoked User Token
    return await Webservice.post(WalletResource.topup(amount));
  }

  // get wallet balance
  Future<DefaultResponseModel> getWalletBalance() async {
    return await Webservice.get(WalletResource.getWalletBalance());
  }
}
