import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

class ProfileSetting extends StatefulWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  TextEditingController name = TextEditingController();
  TextEditingController logIn = TextEditingController();
  TextEditingController phone = TextEditingController();
  late String _name, _phone, _log;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Color.fromRGBO(250, 250, 250, 1),

        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(onTap:(){
             Navigator.pop(context) ;
            },child: Icon(Icons.arrow_back)),
            Text(
              "Profile",
              style: CustomTextStyle.profiledettails(context),
            ),
            GestureDetector(
              onTap: (){
                quit();
              },
                child: SvgPicture.asset("asset/productIcon/log-out.svg"))
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  "asset/Img/IMG_20200418_192738.jpg",
                ),
                radius: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Change photo",
                  style: CustomTextStyle.changePhoto(context),
                ),
              ),
              Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 15),
                      child: Text(
                        "Adyňyz we familiýaňyz",
                        style: CustomTextStyle.drowDown(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: name,
                        // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                        style: TextStyle(
                          fontSize: 18,
                            color: ThemeServices().theme==ThemeMode.dark?Colors.white:Color.fromRGBO(55, 55, 55, 1)),

                        decoration: InputDecoration(
                          fillColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Colors.white,

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
                        onSaved: (deger) => _name = deger!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        "Login",
                        style: CustomTextStyle.drowDown(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: logIn,
                        // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                        style: TextStyle(
                            fontSize: 18,
                            color: ThemeServices().theme==ThemeMode.dark?Colors.white:Color.fromRGBO(55, 55, 55, 1)),

                        decoration: InputDecoration(
                          fillColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Colors.white,

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
                        onSaved: (deger) => _log = deger!,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Text(
                        "Telefon belgiňiz:",
                        style: CustomTextStyle.drowDown(context),
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: TextFormField(
                        textAlign: TextAlign.left,
                        textAlignVertical: TextAlignVertical.center,

                        controller: phone,
                        // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Colors.white,

                          // hintStyle: CustomTextStyle.fieldmax(context),
                          errorStyle: CustomTextStyle.error(context),
                          // hintText: "max",
                        ),
                        style: TextStyle(
                            fontSize: 18,
                            color: ThemeServices().theme==ThemeMode.dark?Colors.white:Color.fromRGBO(55, 55, 55, 1)),
                        // validator: (jog) {
                        //   if (jog!.length == 0) {
                        //     return "full";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        onSaved: (deger) => _phone = deger!,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
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
        ],
      ),
    );
  }

  quit() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Colors.white,

        title: Center(child: Text("Are you sure to quit?",style: CustomTextStyle.quit(context),)),
      actions: [
        ButtonBar(
          alignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(onPressed: (){}, child: Text("Ýok",style: CustomTextStyle.yok(context),)),
            RaisedButton(color: Colrs().mainColo,onPressed: (){},child: Text("Hawa"),)
          ],
        )
      ],
      );

    });
  }


}
