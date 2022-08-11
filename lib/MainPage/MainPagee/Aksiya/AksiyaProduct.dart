import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/ActionProduct/Action.dart';
import 'package:serpay/MainPage/Model/Action.dart';
import 'package:http/http.dart' as http;

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/checkSignUp.dart';
import '../../../LogIn/LogIn/Model/token.dart';

class AksiyaProdutModel {
  String checkLike = "";
  String? token;
  String ip = IpAddress().ipAddress;
  ActionModel? action;
  CheckSignUp checkSignUp = new CheckSignUp();
  Future<ActionModel> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response =
        await http.get(Uri.parse(checkLike.toString().length == 4
            ?"${ip}/users/products/action":"${ip}/public/products/action"),  headers: checkLike.toString().length.toInt() == 4
            ? <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        }
            : {},);
    debugPrint(response.body+"fdsfd");
    var decodedJson = json.decode(response.body);
    action = ActionModel.fromJson(decodedJson);

    return action!;
  }
}