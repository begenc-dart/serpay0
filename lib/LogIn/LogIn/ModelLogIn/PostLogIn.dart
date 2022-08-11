
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/LogIn/LogIn/Model/CheckNumber.dart';
import 'package:serpay/LogIn/LogIn/Model/IdWrite.dart';
import 'package:serpay/LogIn/LogIn/Model/SignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/LogIn/LogIn/ModelLogIn/ModelLogIn.dart';

import '../../../main.dart';
import 'package:http/http.dart' as http;
class PostLogIn{
  int? bcypt;
  Future<ModelLogIn> createUser(
      String phone,String pas,BuildContext context) async {
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/login",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          "user_phone":phone,
          "password":pas
        }));
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());


    if (response.statusCode == 200) {

      Token().tokenDosyaYaz(json.decode(response.body)['token']);
      IdWrite().idwrite(json.decode(response.body)['data']['user']['id'].toString());
      CheckSignUp().dosyaYaz(true.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
            (Route<dynamic> route) => false,
      );


      return ModelLogIn.fromJson(jsonDecode(response.body));
    } else {
      return ModelLogIn.fromJson(jsonDecode(response.body));
    }
  }
}