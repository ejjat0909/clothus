import 'package:clothus/helpers/base_api_response.dart';
import 'package:clothus/models/product/product_model.dart';

class ProductListResponseModel
    extends BaseAPIResponse<List<ProductModel>, Null> {
  ProductListResponseModel(fullJson) : super(fullJson);

  @override
  dataToJson(List<ProductModel>? data) {
    if (this.data != null) {
      return this.data?.map((v) => v.toJson()).toList();
    }
    return null;
  }

  @override
  errorsToJson(Null errors) {
    return null;
  }

  @override
  List<ProductModel>? jsonToData(Map<String, dynamic>? json) {
    if (json != null) {
      data = [];

      json["data"].forEach((v) {
        data!.add(ProductModel.fromJson(v));
      });

      return data!;
    }

    return null;
  }

  @override
  Null jsonToError(Map<String, dynamic> json) {
    return null;
  }
}
