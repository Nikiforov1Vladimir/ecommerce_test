import 'dart:convert';

class Product {
  Product({
    required this.title,
    required this.description,
    required this.images,
    required this.coverImage,
    required this.id,
  });

  String title;
  String description;
  List<String> images;
  String coverImage;
  String id;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    title: json["title"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    coverImage: json["coverImage"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "coverImage": coverImage,
    "id": id,
  };
}
