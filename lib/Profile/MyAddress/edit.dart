import 'package:flutter/material.dart';
import 'package:serpay/Profile/MyAddress/setAdres.dart';

import '../../Model/TextColor.dart';
import 'AddressModel/ModelAddress.dart';
import 'AddressModel/PacthAddress.dart';
import 'MyAddres.dart';
import 'address.dart';

class EditAdress extends StatefulWidget {
  String addres;
  String id;
  String welayat;

  EditAdress({required this.addres, required this.id, required this.welayat});

  @override
  State<EditAdress> createState() => _EditAdressState();
}

class _EditAdressState extends State<EditAdress> {
  TextEditingController textAddres = TextEditingController();
  TextEditingController welayt = TextEditingController();
  bool otomatikKontrol = false;

  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    textAddres = TextEditingController(text: widget.addres);
    welayt=TextEditingController(text: widget.welayat);
    super.initState();
  }

  AddressModel? _addressModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Adresi uytgetmek",
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
                      controller: welayt,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(97, 97, 97, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(97, 97, 97, 1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          contentPadding:
                              EdgeInsets.only(bottom: 15, top: 15, left: 15),

                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color.fromRGBO(174, 174, 174, 1))),
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
                      controller: textAddres,
                      maxLines: 5,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(97, 97, 97, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(97, 97, 97, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        contentPadding:
                            EdgeInsets.only(bottom: 15, top: 15, left: 15),
                      ),
                    ),
                  ),
                  Spacer(),

                  ///button
                  Container(
                    decoration: BoxDecoration(
                      color: select.mainColo,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: select.mainColo),
                      onPressed: () {
                        girisBilgi(context);
                        Navigator.pop(context);Navigator.pop(context);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyAdressClass()));
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
              ),
            )));
  }

  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final AddressModel signUp = await PacthAddress().createUser(widget.id, textAddres.text,welayt.text);
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
