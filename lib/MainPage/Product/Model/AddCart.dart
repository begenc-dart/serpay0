import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:serpay/MainPage/Product/Model/PostCart.dart';

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';
import 'package:http/http.dart' as http;
class AddCart{
  String? token;
  Future<PostCart> createUser(String id,String product_size,String quantity,String check) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/to-my-cart",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        },
        body: jsonEncode(<String, String>{
          "product_id": id,
          "product_size_id":product_size,
          "quantity":quantity,
          "i_take":check

        }));
debugPrint(response.body);

    if (response.statusCode == 200) {

      return PostCart.fromJson(jsonDecode(response.body));
    } else {
      return PostCart.fromJson(jsonDecode(response.body));
    }
  }
}