class Cart {
  String id;
  String productName;
  String productPrice;
  String quantity;
  String image;
  String category;

  Cart(
      {required this.id,
      required this.productName,
      required this.productPrice,
      required this.quantity,
      required this.image,
      required this.category});

  // factory Cart.fromJson(Map<String,dynamic> json) {
  //   return Cart(
  //       id: json['id'],
  //       productName: json["productName"],
  //       productPrice: json["productPrice"],
  //       quantity: json["quantity"],
  //       category: json["category"],
  //       image: json["image"]);
  // }
  // dynamic toJson() => {
  //       'id': id,
  //       'productName': productName,
  //       'productPrice': productPrice,
  //       'quantity': quantity,
  //       'category': category,
  //       'image': image
  //     };
}
