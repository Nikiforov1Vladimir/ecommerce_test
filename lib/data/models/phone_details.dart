import 'dart:convert';

PhoneDetails phoneDetailsFromJson(String str) => PhoneDetails.fromJson(json.decode(str));

String phoneDetailsToJson(PhoneDetails data) => json.encode(data.toJson());

class PhoneDetails {
  PhoneDetails({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });

  String cpu;
  String camera;
  List<String> capacity;
  List<String> color;
  String id;
  List<String> images;
  bool isFavorites;
  int price;
  double rating;
  String sd;
  String ssd;
  String title;

  factory PhoneDetails.fromJson(Map<String, dynamic> json) => PhoneDetails(
    cpu: json["CPU"],
    camera: json["camera"],
    capacity: List<String>.from(json["capacity"].map((x) => x)),
    color: List<String>.from(json["color"].map((x) => x)),
    id: json["id"],
    images: List<String>.from(json["images"].map((x) => x)),
    isFavorites: json["isFavorites"],
    price: json["price"],
    rating: json["rating"].toDouble(),
    sd: json["sd"],
    ssd: json["ssd"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "CPU": cpu,
    "camera": camera,
    "capacity": List<dynamic>.from(capacity.map((x) => x)),
    "color": List<dynamic>.from(color.map((x) => x)),
    "id": id,
    "images": List<dynamic>.from(images.map((x) => x)),
    "isFavorites": isFavorites,
    "price": price,
    "rating": rating,
    "sd": sd,
    "ssd": ssd,
    "title": title,
  };


}
