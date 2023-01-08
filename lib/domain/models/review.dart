import 'dart:convert';

class Review {
  Review({
    required this.rating,
    required this.title,
    required this.description,
    required this.id,
    required this.phoneId,
  });

  int rating;
  String title;
  String description;
  String id;
  String phoneId;

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"],
    title: json["title"],
    description: json["description"],
    id: json["id"],
    phoneId: json["phoneId"],
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "title": title,
    "description": description,
    "id": id,
    "phoneId": phoneId,
  };
}
