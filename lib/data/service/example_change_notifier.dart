import 'package:ecommerce_test/domain/models/product.dart';
import 'package:flutter/cupertino.dart';

class ExampleChangeNotifier extends ChangeNotifier{
  final _products = <Product>[];
  get products => _products;
}