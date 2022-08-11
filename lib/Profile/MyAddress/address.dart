

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/AddressGet.dart';
import 'package:serpay/Profile/MyAddress/MyAddres.dart';

import '../../darkMode/theme_services.dart';
import 'setAdres.dart';
import 'package:http/http.dart'as http;

class MyAdressClass extends StatefulWidget {
  @override
  State<MyAdressClass> createState() => _MyAdressClassState();
}

class _MyAdressClassState extends State<MyAdressClass> {
  AddressGet? addressGet;

  Future<AddressGet>? getAd;
String? token;
  Future<AddressGet> addresGet() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    final response = await http.get(Uri.parse( "${IpAddress().ipAddress}/users/address"),headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    },);

    var decodedJson = json.decode(response.body);
     addressGet= AddressGet.fromJson(decodedJson);

    debugPrint(response.body.toString());
    return addressGet!;
  }
@override
  void initState() {
    // TODO: implement initState
  getAd=addresGet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text(
          "My Address",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ThemeServices().theme == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body:FutureBuilder(future: getAd,builder: (context, AsyncSnapshot<AddressGet> snapshot) {
        if(snapshot.hasData){
          return snapshot.data!.address!.length==0?  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: const Color.fromRGBO(174, 174, 174, 1), width: 1)

                  //color: Color.fromRGBO(174, 174, 174, 1)
                ),
                child: const Center(
                  child: Text(
                    "Adres yok, adres gosun.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(174, 174, 174, 1)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                decoration: BoxDecoration(
                  color: select.mainColo,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: select.mainColo),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AddAdress()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text(
                          "Taze adres gosmak",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):MyAddress(addres: snapshot.data!.address!,);
        }
        else{
          debugPrint(snapshot.toString());
          return Center(child: CircularProgressIndicator());
        }
      })
    );
  }
}
