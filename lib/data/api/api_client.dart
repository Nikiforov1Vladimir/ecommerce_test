import 'dart:convert';

import 'package:ecommerce_test/domain/models/product.dart';
import 'package:ecommerce_test/domain/models/review.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  Future<Product> getProduct(int id) async{
    Uri url = Uri.parse('https://63b6e2504f17e3a931c35aee.mockapi.io/phone/$id');
    var response = await http.get(url);
    var data = await jsonDecode(response.body);
    return Product.fromJson(data);
  }

  Future<List<Review>> getProductReviews(int id) async{
    Uri url = Uri.parse('https://63b6e2504f17e3a931c35aee.mockapi.io/phone/$id/reviews');
    var response = await http.get(url);
    var data = await jsonDecode(response.body) as List<dynamic>;
    return data.map((e) => Review.fromJson(e)).toList();
  }



}