import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/ForgetPassword.dart';

import 'package:serpay/LogIn/LogIn/Model/SignUp.dart';
import 'package:serpay/LogIn/LogIn/ModelLogIn/ModelLogIn.dart';

import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';

import '../../darkMode/theme_services.dart';
import 'Model/fetchAlbum.dart';
import 'ModelLogIn/PostLogIn.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  Colrs colrs = Colrs();
  int grvalue = 1;

  bool otomatikKontrol = false;
  late String _login,
      _logInpassword,
      _signUpnumber;
  final _formkey = GlobalKey<FormState>();
  final _logInKey = GlobalKey<FormState>();
SignUpProg? _signUpProg;
  ModelLogIn? _modelLogIn;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
            style: CustomTextStyle.carAppBar(context),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 15),
                    child: CupertinoSlidingSegmentedControl<int>(
                      backgroundColor: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(97, 97, 97, 1)
                          : Colors.white,
                      thumbColor: Color.fromRGBO(255, 20, 29, 1),
                      children: {
                        1: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                grvalue == 1
                                    ? SvgPicture.asset(
                                        "asset/productIcon/log-in.svg")
                                    : SvgPicture.asset(
                                        "asset/productIcon/log-in1.svg"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Login",
                                    style: grvalue == 1
                                        ? CustomTextStyle.quit(context)
                                        : CustomTextStyle.signUp(context),
                                  ),
                                ),
                              ],
                            )),
                        2: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                grvalue == 2
                                    ? SvgPicture.asset(
                                        "asset/productIcon/user-plus (1).svg")
                                    : SvgPicture.asset(
                                        "asset/productIcon/user-plus.svg"),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Sign up",
                                    style: grvalue == 2
                                        ? CustomTextStyle.quit(context)
                                        : CustomTextStyle.signUp(context),
                                  ),
                                ),
                              ],
                            ))
                      },
                      onValueChanged: (int? value) {
                        setState(
                          () {
                            grvalue = value!;
                          },
                        );
                      },
                      groupValue: grvalue,
                    )),
              ),
              grvalue == 1
                  ? Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 191,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Form(
                          key: _logInKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 50),
                                child: Text(
                                  "Phone Number",
                                  style:
                                  CustomTextStyle.drowDown(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  textAlignVertical:
                                  TextAlignVertical.top,

                                  // cursorColor: Color.fromRGBO(104, 109, 118, 1),
keyboardType: TextInputType.number,

                                  decoration: InputDecoration(
                                    // hintStyle:CustomTextStyle.fieldmax(context),
                                    errorStyle:
                                    CustomTextStyle.error(context),
                                    prefixText: "+993"
                                    // hintText: "min",
                                  ),
                                  // validator: (jog) {
                                  //   if (jog!.length == 0) {
                                  //     return "full";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  onSaved: (deger) => _login = deger!,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, top: 5),
                                child: Text(
                                  "A??ar sozi??iz",
                                  style:
                                  CustomTextStyle.drowDown(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextFormField(
                                  textAlignVertical:
                                  TextAlignVertical.top,

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
                                  _logInpassword = deger!,
                                ),
                              ),

                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ForgetPassword()));
                          },
                          child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  "A??ar s??z??ni unutdym!",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromRGBO(255, 50, 50, 1)),
                                ),
                              )),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        logInOpen(context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        margin:
                        EdgeInsets.only(left: 15, right: 15, bottom: 5),
                        decoration: BoxDecoration(
                            color: select.mainColo,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          "Agza bol",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: select.tmcolo),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height -210,

                    child: ListView(
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
                                  "Telefon belgi??iz",
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
                                  //   if (jog!.length == 6) {
                                  //     return "full";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  onSaved: (deger) => _signUpnumber = deger!,
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
                        "I??eri gir",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: select.tmcolo),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void logInOpen(BuildContext context) async {
    if (_logInKey.currentState!.validate()) {
      _logInKey.currentState!.save();

      final ModelLogIn signUp = await PostLogIn().createUser("+993$_login",_logInpassword,context);
      setState(() {
        _modelLogIn = signUp;
      });
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }
  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final String phone = '+993'+_signUpnumber;
      final SignUpProg signUp = await TakePostSignUp().createUser(phone,context);
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
