import 'package:clothus/models/product/product_list_response_model.dart';
import 'package:clothus/resource/product_resource.dart';
import 'package:clothus/services/web_services.dart';

class ProductBloc {
  Future<ProductListResponseModel> getListProducts() async {
    return await Webservice.get(ProductResource.getProductsList());
  }
}
