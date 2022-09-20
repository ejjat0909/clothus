class ProductModel {
  int? id;
  String? image;
  String? price;
  String? title;

  ProductModel({this.id, this.image, this.price, this.title});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    price = json['price'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['price'] = this.price;
    data['title'] = this.title;
    return data;
  }
}
