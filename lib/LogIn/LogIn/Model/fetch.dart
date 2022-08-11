
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/LogIn/LogIn/Model/CheckNumber.dart';
import 'package:serpay/LogIn/LogIn/Model/IdWrite.dart';
import 'package:serpay/LogIn/LogIn/Model/SignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';

import '../../../main.dart';
import 'package:http/http.dart' as http;
class TakePostSignUp{
  int? bcypt;

  TextEditingController _controller= TextEditingController();
  Future<SignUpProg> createUser(
 String signUp, String check, String name, String pas, String secpas,BuildContext context) async {
    final response = await http.post(
        Uri.parse(
          "${IpAddress().ipAddress}/users/signup",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(<String, String>{
          'username': name,
          "user_checked_phone": check,
          'password': pas,
          'passwordConfirm': secpas,
          "nickname":signUp
        }));
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());


    if (response.statusCode == 201) {

      Token().tokenDosyaYaz(json.decode(response.body)['token']);
      IdWrite().idwrite(json.decode(response.body)['data']['user']['id'].toString());
      CheckSignUp().dosyaYaz(true.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
            (Route<dynamic> route) => false,
      );


      return SignUpProg.fromJsonMap(jsonDecode(response.body));
    } else {
      return SignUpProg.fromJsonMap(jsonDecode(response.body));
    }
  }


}