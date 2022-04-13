class ProductsModel {
  int id;
  String image;
  String mainName;
  String price;

  ProductsModel(this.id, this.image, this.mainName, this.price);

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        json['id'],
        json["image_one"],
        json["name"],
        json["price"],
      );
}
