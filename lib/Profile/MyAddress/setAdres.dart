import 'package:flutter/material.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/AddressAdd.dart';
import 'package:serpay/Profile/MyAddress/address.dart';

import '../../Model/TextColor.dart';
import '../../darkMode/theme_services.dart';
import 'AddressModel/ModelAddress.dart';
import 'MyAddres.dart';

class AddAdress extends StatefulWidget {

  @override
  State<AddAdress> createState() => _AddAdressState();
}

class _AddAdressState extends State<AddAdress> {
  bool otomatikKontrol = false;

  late String _address,welayat;

  final _formkey = GlobalKey<FormState>();

  AddressModel? _addressModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(39, 39, 39, 1)
              : Color.fromRGBO(250, 250, 250, 1),
          elevation: 0,
          title: Text(
            "Adres gosmak",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ThemeServices().theme == ThemeMode.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        body: Form(
          key: _formkey,
            child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Saher, welayat",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(97, 97, 97, 1)),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 25),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(97, 97, 97, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(97, 97, 97, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding:
                          EdgeInsets.only(bottom: 15, top: 15, left: 15),
                      hintText: "Dostluk",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color.fromRGBO(174, 174, 174, 1))),
                  onSaved: (val)=>welayat=val.toString(),
                ),
              ),
              Text(
                "Adresinizi doly girizin",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(97, 97, 97, 1)),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                ),
                child: TextFormField(
                  maxLines: 5,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(97, 97, 97, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(97, 97, 97, 1)),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding:
                        EdgeInsets.only(bottom: 15, top: 15, left: 15),
                  ),
                  onSaved: (value){_address=value.toString();}
                ),
              ),
              Spacer(),

              ///button
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: select.mainColo),
                  onPressed: () {
                    girisBilgi(context);
                   Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAdressClass()));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text(
                          "Adres gos",
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
          ),
        )));
  }

  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();


      final AddressModel signUp = await AddressAdd().createUser(_address,welayat);
      setState(() {
        _addressModel = signUp;
      });
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }
}
