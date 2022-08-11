import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:serpay/MainPage/MainPagee/MainPage.dart';
import 'package:serpay/darkMode/theme_provider.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';
import '../../../Search/Search/Search.dart';
import '../../../main.dart';
class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //const Search({Key? key}) : super(key: key);
  ThemeProvider? themeProvider = ThemeProvider();

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15, horizontal: 15),
      child: Row(
        children: [
          InkWell(
              onTap: (){
                ThemeServices().switchTheme();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyApp()));
              },
              child: SvgPicture.asset("asset/icon/Subtract (2).svg")),
          Expanded(
            child: InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(
                    left: 15, right: 15),
                height: 40,
                alignment: Alignment.centerLeft,
                decoration:  BoxDecoration(
                    color: select.searh,
                    borderRadius: BorderRadius.all(
                        Radius.circular(20))),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: CustomTextStyle.searchStyle(context),
                    ),
                    SvgPicture.asset("asset/icon/qr.svg")
                  ],
                ),
              ),
            ),
          ),
          SvgPicture.asset("asset/icon/Group 59 (1).svg",)//color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1):Colors.white,)
        ],
      ),
    );
  }
}
