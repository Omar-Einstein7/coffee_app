// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));



class Product {
  String image;
  String title;
  String subTitle;
  double price;
  int volume;
  int quantity;

  Product({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.price,
    required this.volume,
    this.quantity = 1
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"],
        title: json["title"],
        subTitle: json["subTitle"],
        price: json["price"]?.toDouble(),
        volume: json["volume"],
          quantity: json['quantity'] ?? 1,
      );

 Product copyWith({String? name, String? description, double? price, int? quantity}) {
    return Product(
      image: image ?? this.image,
      title: name ?? this.title,
      subTitle: description ?? this.subTitle,
      price: price ?? this.price,
      volume: volume ?? this.volume,
      quantity: quantity ?? this.quantity,
    );
  }

}
