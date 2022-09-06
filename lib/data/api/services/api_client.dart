import 'dart:convert';

import 'package:ecommerce_test/domain/models/basket.dart';
import 'package:ecommerce_test/domain/models/phone.dart';
import 'package:ecommerce_test/domain/models/phone_details.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  Future<PhoneDetails> getPhoneInfo() async{

    final response = await http.get(Uri.parse('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'));
    
    var phoneInfo = jsonDecode(response.body);
    
    return PhoneDetails.fromJson(phoneInfo);
  }

  Future<Phone> getHomePageInfo() async{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175'));

    var phone = jsonDecode(response.body);

    return Phone.fromJson(phone);
  }

  Future<Basket> getBasket() async{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149'));

    var basket = jsonDecode(response.body);

    return Basket.fromJson(basket);
  }
}