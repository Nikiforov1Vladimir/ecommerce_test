// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.bestSeller,
  });

  List<BestSeller> bestSeller;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    bestSeller: List<BestSeller>.from(json["best_seller"].map((x) => BestSeller.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
  };
}

class BestSeller {
  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });

  int id;
  bool isFavorites;
  String title;
  int priceWithoutDiscount;
  int discountPrice;
  String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
    id: json["id"],
    isFavorites: json["is_favorites"],
    title: json["title"],
    priceWithoutDiscount: json["price_without_discount"],
    discountPrice: json["discount_price"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "is_favorites": isFavorites,
    "title": title,
    "price_without_discount": priceWithoutDiscount,
    "discount_price": discountPrice,
    "picture": picture,
  };
}
