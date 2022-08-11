import 'package:flutter/material.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/Model/ChangePasswordModel.dart';
import 'package:serpay/Model/TextColor.dart';

import 'Model/passwordModel.dart';

class ChangePassword extends StatefulWidget {

String phone;
ChangePassword({required this.phone});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  late String _loginpasswordAgain, _logInpassword;
  final _formkey = GlobalKey<FormState>();
late ChangePasModel changePasModel;
bool otomatik=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: CustomTextStyle.profiledettails(context),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          "New password:",
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
                            suffixIcon: Icon(Icons.remove_red_eye_sharp),
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _loginpasswordAgain = deger!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Confirm new password:",
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
                            suffixIcon: Icon(Icons.remove_red_eye_sharp),
                            // hintStyle:CustomTextStyle.fieldmax(context),

                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _logInpassword = deger!,
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
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                        color: select.mainColo,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Save",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: select.tmcolo),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final ChangePasModel signUp = await ChangePaswModel().createUser(widget.phone,_loginpasswordAgain,_logInpassword,context);
      setState(() {
        changePasModel = signUp;
      });
    } else {
      setState(() {
        otomatik = true;
      });
    }
  }
}
