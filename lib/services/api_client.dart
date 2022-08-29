import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_test/data/models/phone.dart';
import 'package:ecommerce_test/data/models/phone_details.dart';

class ApiClient{

  final client = HttpClient();

  Future<List<Phone>> getPhoneInfo() async{
    final url = Uri.parse('https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175');
    final request = await client.getUrl(url);
    final response = await request.close();
    final jsonStrings = await response.transform(utf8.decoder).toList();
    final jsonString = jsonStrings.join();
    final json = jsonDecode(jsonString) as List<dynamic>;
    final phoneList = json.map((dynamic e) =>
        Phone.fromJson(e as Map<String,dynamic>))
        .toList();
    return phoneList;
  }
}