import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../IpAdress.dart';
import '../../../LogIn/LogIn/Model/token.dart';
class DeleteAddress{
  String? token;
  Future deleteAlbum(String id) async {

    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final  response = await http.delete(
      Uri.parse('${IpAddress().ipAddress}/users/address/$id'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      },
    );
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}