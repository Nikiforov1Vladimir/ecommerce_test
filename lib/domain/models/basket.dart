import 'dart:convert';

Basket basketFromJson(String str) => Basket.fromJson(json.decode(str));

String basketToJson(Basket data) => json.encode(data.toJson());

class Basket {
  Basket({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  List<BasketElement> basket;
  String delivery;
  String id;
  int total;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
    basket: List<BasketElement>.from(json["basket"].map((x) => BasketElement.fromJson(x))),
    delivery: json["delivery"],
    id: json["id"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "basket": List<dynamic>.from(basket.map((x) => x.toJson())),
    "delivery": delivery,
    "id": id,
    "total": total,
  };
}

class BasketElement {
  BasketElement({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  int id;
  String images;
  int price;
  String title;

  factory BasketElement.fromJson(Map<String, dynamic> json) => BasketElement(
    id: json["id"],
    images: json["images"],
    price: json["price"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "images": images,
    "price": price,
    "title": title,
  };
}
