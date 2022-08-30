import 'dart:convert';

import 'package:ecommerce_test/data/models/phone_details.dart';
import 'package:http/http.dart' as http;

class ApiClient{

  Future<PhoneDetails> getPhoneInfo() async{

    final response = await http.get(Uri.parse('https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5'));
    
    var phoneInfo = jsonDecode(response.body);
    
    return PhoneDetails.fromJson(phoneInfo);
  }
}