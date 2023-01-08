import 'package:ecommerce_test/domain/models/product.dart';

class Phone extends Product {

  String cpu;
  String screen;

  Phone(
      {required super.title,
      required super.description,
      required super.images,
      required super.coverImage,
      required super.id,
      required this.cpu,
      required this.screen
      });


}
