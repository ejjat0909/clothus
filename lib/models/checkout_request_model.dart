class CheckoutRequestModel {
  String? name;
  int? productId;
  int? quantity;
  String? address;

  CheckoutRequestModel(
      {this.name, this.productId, this.quantity, this.address});

  CheckoutRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productId = json['product_id'];
    quantity = json['quantity'];
    address = json['adsress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['address'] = this.address;
    return data;
  }
}
