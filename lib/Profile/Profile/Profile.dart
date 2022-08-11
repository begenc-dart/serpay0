
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:serpay/Profile/Profile/Cancelled.dart';
import 'package:serpay/Profile/Profile/Like.dart';
import 'package:serpay/Profile/Profile/MessageCenter.dart';
import 'package:serpay/Profile/History/MyHistory.dart';
import 'package:serpay/Profile/Profile/OnGoing.dart';
import 'package:serpay/Profile/Profile/OrderHistory.dart';
import 'package:serpay/Profile/Profile/ProfileSetting.dart';
import 'package:serpay/Profile/Profile/RadioButton.dart';
import 'package:serpay/Profile/Profile/Setting.dart';
import 'package:serpay/darkMode/theme_services.dart';


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String radioItem = 'Item 1';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              AssetImage("asset/Img/IMG_20200418_192738.jpg"),
                          radius: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Adam Johnson",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500,
                                  color:  ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "+993 63 626160",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    InkWell(onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileSetting()));
                    },child: Icon(Icons.edit,color: ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),)
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Deliver()));
                      },
                      child: profile("Orders History",
                          "asset/ProfileIcon/NicePng_history-icon-png_3019331 1.jpg"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => OnGoing()));
                      },
                      child: profile(
                          "Waiting Orders", "asset/ProfileIcon/image 23.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cancelled()));
                      },
                      child: profile("Cancelled Orders",
                          "asset/ProfileIcon/NicePng_subscription-icon-png_3632609 1.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => History()));
                        },
                        child: profile("My History",
                            "asset/ProfileIcon/NicePng_foot-steps-png_761552 1.png")),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => WishLike()));
                      },
                      child:
                          profile("Wish List", "asset/ProfileIcon/Vector.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MessageCenter()));
                      },
                      child: profile("Message Center",
                          "asset/ProfileIcon/NicePng_call-icon-png_5136986 1.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Colors.white,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            title: Column(
                              children: [
                                RadioListTile(
                                  controlAffinity: ListTileControlAffinity.trailing,
                                  groupValue: radioItem,
                                  title: Text('Ashgabad',
                                  style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),
                                  ),
                                  value: 'Item 1',
                                  onChanged: (val) {
                                    setState(() {
                                      radioItem = val.toString();
                                    });
                                  },
                                ),
                                RadioListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                  groupValue: radioItem,
                                  title: Text('Ahal',
                                    style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),),
                                  value: 'Item 2',
                                  onChanged: null
                                ),
                                RadioListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    groupValue: radioItem,
                                    title: Text('Balkan',
                                      style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),),
                                    value: 'Item 3',
                                    onChanged: null
                                ),
                                RadioListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    groupValue: radioItem,
                                    title: Text('Dashoguz',
                                      style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),),
                                    value: 'Item 4',
                                    onChanged: null
                                ),
                                RadioListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    groupValue: radioItem,
                                    title: Text('Lebap',
                                      style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),),
                                    value: 'Item 5',
                                    onChanged: null
                                ),
                                RadioListTile(
                                    controlAffinity: ListTileControlAffinity.trailing,
                                    groupValue: radioItem,
                                    title: Text('Mary',
                                      style: TextStyle(color:ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),),
                                    value: 'Item 5',
                                    onChanged: null
                                ),
                              ],
                            ),
                          );
                        });
                      },
                      child: profile("Set Location",
                          "asset/ProfileIcon/NicePng_location-icon-png_94335 1.png"),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Setting()));
                        },
                        child: profile(
                            "Settings", "asset/ProfileIcon/settings.png")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  diag(){

  }
  profile(String typeProfile, String asset) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
      width: 75,
      height: 70,
      decoration: BoxDecoration(color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): Color.fromRGBO(246, 246, 246, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(asset),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(
              typeProfile,style: TextStyle(color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1): Color.fromRGBO(65, 65, 65, 1)),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

