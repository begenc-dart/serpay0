import 'package:flutter/material.dart';

import '../../Model/Colors.dart';
import '../../Model/TextColor.dart';
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Colrs colrs = Colrs();
  int grvalue = 1;

  late String
      _signUpname,
      _signUpLogin,
      _signUpnumber,
      _message;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
      ),
      body: ListView(
        children: [

          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Adyňyz we familiýaňyz",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    // validator: (jog) {
                    //   if (jog!.length == 0) {
                    //     return "full";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (deger) => _signUpname = deger!,
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Telefon belgiňiz",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: "+993",
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    // validator: (jog) {
                    //   if (jog!.length == 0) {
                    //     return "full";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (deger) => _signUpnumber = deger!,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Email (optional)",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    // validator: (jog) {
                    //   if (jog!.length == 0) {
                    //     return "full";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (deger) => _signUpLogin = deger!,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Message",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    maxLines: 4,
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    // validator: (jog) {
                    //   if (jog!.length == 0) {
                    //     return "full";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (deger) => _message = deger!,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(
                left: 15, right: 15, bottom: 5, top: 20),
            decoration: BoxDecoration(
                color: select.mainColo,
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              "Send",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: select.tmcolo),
            ),
          ),
        ],
      ),
    );
  }
}
