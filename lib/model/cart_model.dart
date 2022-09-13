class Cart {
  int id;
  String productName;
  double productPrice;
  int quantity;
  String image;
  int category;

  Cart(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.quantity,
      required this.image,
      required this.category});

  factory Cart.fromJson(Map<dynamic, dynamic> json) {
    return Cart(
        id: json['id'],
        productName: json["productName"],
        productPrice: json["productPrice"],
        quantity: json["quantity"],
        category: json["category"],
        image: json["image"]);
  }
  dynamic toJson() => {
        'id': id,
        'productName': productName,
        'productPrice': productPrice,
        'quantity': quantity,
        'category': category,
        'image': image
      };
}
