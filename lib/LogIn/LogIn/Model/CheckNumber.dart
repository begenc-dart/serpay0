import 'dart:convert';

import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;

import '../../../Model/Colors.dart';
import '../../../Model/TextColor.dart';
import 'SignUp.dart';
import 'fetch.dart';
class CheckNumber extends StatefulWidget {
  String num;
  CheckNumber({required this.num});

  @override
  State<CheckNumber> createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> {
  Colrs colrs = Colrs();

  int grvalue = 1;

  late String _login,
      _logInpassword,
      _passowrdLoginagin,
      _signUpname,
      _signUpLogin,
      _signUpnumber,
      _signuppassword,
      _signuppasswordagin;

  final _formkey = GlobalKey<FormState>();

  bool otomatikKontrol = false;
  SignUpProg? _signUpProg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(title: Text("SignUp"),),
      body:  Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 191,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [colrs.tmConCol, colrs.person]),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.person_outline_sharp,
                    size: 50,
                    color: colrs.shareCol,
                  ),
                ),
                Center(
                    child: Text(
                      "Change photo",
                      style: CustomTextStyle.changePhoto(context),
                    )),
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
                          "Login",
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
                        const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Açar soziňiz",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          obscureText: true,
                          decoration: InputDecoration(
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            suffixIcon:
                            Icon(Icons.remove_red_eye_sharp),
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
                          onSaved: (deger) =>
                          _signuppassword = deger!,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Açar soziňizi tassyklaň",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15),
                        child: TextFormField(
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                          decoration: InputDecoration(
                            suffixIcon:
                            Icon(Icons.remove_red_eye_sharp),
                            // hintStyle: CustomTextStyle.fieldmax(context),
                            errorStyle:
                            CustomTextStyle.error(context),
                            // hintText: "max",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) =>
                          _signuppasswordagin = deger!,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          InkWell(
            onTap: (){
              girisBilgi(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: 15, right: 15, bottom: 5, top: 20),
              decoration: BoxDecoration(
                  color: select.mainColo,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Içeri gir",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: select.tmcolo),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final SignUpProg signUp = await TakePostSignUp().createUser(_signUpLogin,widget.num,_signUpname,_signuppassword,_signuppasswordagin,context);
      setState(() {
        _signUpProg = signUp;
      });
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }
}
