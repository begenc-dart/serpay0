import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

class MessageCenter extends StatefulWidget {
  const MessageCenter({Key? key}) : super(key: key);

  @override
  _MessageCenterState createState() => _MessageCenterState();
}

class _MessageCenterState extends State<MessageCenter> {
  Colrs colrs = Colrs();
  TextEditingController message = TextEditingController();
  late String _message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Color.fromRGBO(250, 250, 250, 1),


        elevation: 1,
        title: Text(
          "Message Center",
          style: CustomTextStyle.profiledettails(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 166,
                child: ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 92,
                      margin: EdgeInsets.only(
                          left: 45, right: 15, top: 15, bottom: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(255, 20, 29, 0.45): colrs.message,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: CustomTextStyle.chatred(context),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 92,
                      margin: EdgeInsets.only(
                          left: 15, right: 45, top: 15, bottom: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): colrs.tmcolo,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: colrs.photodotOffCol, width: 1)),
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                        style: CustomTextStyle.chatwhite(context),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): colrs.tmcolo),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: message,
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(229, 229, 229, 1)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.blue),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(45, 45, 45, 1): Color.fromRGBO(255, 255, 255, 1),
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
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color:colrs.mainColo),
                      child:
                          Center(child: SvgPicture.asset("asset/productIcon/Vector (1).svg",width: 20,height: 20,)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
