import 'package:meta/meta.dart';
import 'dart:convert';

import 'review.dart';

class Product {
  Product({
    required this.title,
    required this.description,
    required this.coverImage,
    required this.images,
    required this.cpu,
    required this.screen,
    required this.rating,
    required this.price,
    required this.discount,
    required this.stock,
    required this.id,
    required this.reviews
  });

  String title;
  String description;
  String coverImage;
  List<String> images;
  String cpu;
  String screen;
  double? rating;
  double price;
  double? discount;
  int stock;
  String id;
  List<Review> reviews;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"],
    description: json["description"],
    coverImage: json["coverImage"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    cpu: json["cpu"],
    screen: json["screen"],
    rating: json["rating"].toDouble(),
    price: json["price"].toDouble(),
    discount: json["discount"].toDouble(),
    stock: json["stock"],
    id: json["id"],
    reviews: List<Review>.from(json["reviews"].map((e) => Review.fromJson(e))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "coverImage": coverImage,
    "images": images == null ? [] : List<dynamic>.from(images.map((x) => x)),
    "cpu": cpu,
    "screen": screen,
    "rating": rating,
    "price": price,
    "discount": discount,
    "stock": stock,
    "id": id,
    "reviews" : List<dynamic>.from(reviews.map((e) => e.toJson()))
  };
}
