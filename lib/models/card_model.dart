class CardModel {
  int? id;
  String? image;
  String? mainName;
  double? price;
  String? size;
  String? drink;
  int? count;
  List<String>? extra;
  double? total;
  String? orderMethod;
  int? table;

  CardModel(
      {this.id,
      this.image,
      this.mainName,
      this.price,
      this.count,
      this.size,
      this.drink,
      this.extra,
      this.total,
      this.orderMethod,
      this.table});
}
