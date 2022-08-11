import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Profile/MyAddress/MyAddres.dart';
import 'package:serpay/Profile/Profile/Contact.dart';
import 'package:serpay/Profile/Profile/Help.dart';
import 'package:serpay/Profile/NewPassword/Security.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../MyAddress/address.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ThemeServices().theme == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              newDialog(context);
            },
            child: setin(context, "asset/Setting/Language.svg", "Language"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyAdressClass()));
            },
            child: setin(context, "asset/Setting/Address.svg", "My address"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                        appbartitle: 'Help',
                        contexttitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam etiam erat velit scelerisque in dictum non consectetur a. Bibendum at varius vel pharetra vel. Adipiscing elit pellentesque habitant morbi tristique. In hendrerit gravida rutrum quisque non. Non blandit massa enim nec dui nunc mattis enim ut. Cursus turpis massa tincidunt dui. Nec ultrices dui sapien eget mi proin sed libero enim. Donec enim diam vulputate ut pharetra sit amet. Elementum tempus egestas sed sed risus pretium. Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Adipiscing elit duis tristique sollicitudin. Faucibus interdum posuere lorem ipsum dolor. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus sed. Commodo sed egestas egestas fringilla.',
                      )));
            },
            child: setin(context, "asset/Setting/Help.svg", "Help"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Security()));
            },
            child: setin(context, "asset/Setting/Security.svg", "Security"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                        appbartitle: 'Terms of Use',
                        contexttitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam etiam erat velit scelerisque in dictum non consectetur a. Bibendum at varius vel pharetra vel. Adipiscing elit pellentesque habitant morbi tristique. In hendrerit gravida rutrum quisque non. Non blandit massa enim nec dui nunc mattis enim ut. Cursus turpis massa tincidunt dui. Nec ultrices dui sapien eget mi proin sed libero enim. Donec enim diam vulputate ut pharetra sit amet. Elementum tempus egestas sed sed risus pretium. Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Adipiscing elit duis tristique sollicitudin. Faucibus interdum posuere lorem ipsum dolor. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus sed. Commodo sed egestas egestas fringilla.',
                      )));
            },
            child: setin(context, "asset/Setting/terms.svg", "Terms of Use"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                        appbartitle: 'About Us',
                        contexttitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquam etiam erat velit scelerisque in dictum non consectetur a. Bibendum at varius vel pharetra vel. Adipiscing elit pellentesque habitant morbi tristique. In hendrerit gravida rutrum quisque non. Non blandit massa enim nec dui nunc mattis enim ut. Cursus turpis massa tincidunt dui. Nec ultrices dui sapien eget mi proin sed libero enim. Donec enim diam vulputate ut pharetra sit amet. Elementum tempus egestas sed sed risus pretium. Vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique. Phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet. Adipiscing elit duis tristique sollicitudin. Faucibus interdum posuere lorem ipsum dolor. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus sed. Commodo sed egestas egestas fringilla.',
                      )));
            },
            child: setin(context, "asset/Setting/about.svg", "About Us"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Contact()));
            },
            child: setin(context, "asset/Setting/contact.svg", "Contact"),
          ),
          setin(context, "asset/Setting/share.svg", "Share"),
        ],
      ),
    );
  }

  Future<dynamic> newDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 500,
          height: 150,
          child: SimpleDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(39, 39, 39, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            titlePadding: EdgeInsets.only(left: 17, top: 16),
            // title: Text(ady),
            contentPadding: EdgeInsets.only(left: 17, top: 16, bottom: 10),
            children: [
              SimpleDialogOption(
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Turkmençe",
                      style: TextStyle(
                          fontSize: 16,
                          color: ThemeServices().theme == ThemeMode.dark
                              ? Color.fromRGBO(250, 250, 250, 1)
                              : Color.fromRGBO(41, 41, 41, 1)),
                    )),
                onPressed: () async {
                  // if (url == "tm" || url == null) {
                  //   Navigator.pop(context);
                  // } else {
                  //   LanguageFileWrite('tm');
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => MyApp(5)),
                  //         (Route<dynamic> route) => false,
                  //   );
                  // }
                },
              ),
              SimpleDialogOption(
                child: Text(
                  "Pусский",
                  style: TextStyle(
                      fontSize: 16,
                      color: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(250, 250, 250, 1)
                          : Color.fromRGBO(41, 41, 41, 1)),
                ),
                onPressed: () async {
                  // if (url == "ru") {
                  //   Navigator.pop(context);
                  // } else {
                  //   LanguageFileWrite('ru');
                  //   Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => MyApp(5)),
                  //         (Route<dynamic> route) => false,
                  //   );
                  // }
                },
              ),
            ],
          ),
        );
      });
  setin(BuildContext context, String urlIcon, String textset) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(urlIcon,
                color: ThemeServices().theme == ThemeMode.dark
                    ? Color.fromRGBO(174, 174, 174, 1)
                    : Color.fromRGBO(41, 41, 41, 1)),
          ),
          Text(
            textset,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ThemeServices().theme == ThemeMode.dark
                    ? Color.fromRGBO(174, 174, 174, 1)
                    : Color.fromRGBO(41, 41, 41, 1)),
          )
        ],
      ),
    );
  }
}
