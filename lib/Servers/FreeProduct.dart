import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Servers/FreeProductPerson/FreeProductTop.dart';
import 'package:serpay/Servers/ProductAppBar/ProductAppBar.dart';
import 'package:serpay/Servers/ProductDescpiton/ProductDes.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../Model/Colors.dart';

class FreeProduct extends StatefulWidget {
  const FreeProduct({Key? key}) : super(key: key);

  @override
  _FreeProductState createState() => _FreeProductState();
}

class _FreeProductState extends State<FreeProduct> {
  List photoProduct = ["asset/Img/1.png", "asset/Img/1.png", "asset/Img/1.png"];
  int currentPos = 0;
  Colrs select = Colrs();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 80,
              child: CustomScrollView(
                slivers: [
                  ProductAppBar(),
                  ProductDesc(),
                  FreeProductTop()
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  decoration: BoxDecoration(color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1): select.scaf, boxShadow: [
                    BoxShadow(
                        color: select.shadowCol,
                        blurRadius: 20,
                        spreadRadius: -5,
                        offset: Offset.fromDirection(0, -4))
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/icon/Group 42.svg",color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(250, 250, 250, 1):Color.fromRGBO(39, 39, 39, 1),),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            "72h:57m",
                            style: CustomTextStyle.freeProdcuttime(context),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    quit();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    decoration: BoxDecoration(
                        color: select.mainColo,
                        boxShadow: [
                          BoxShadow(color: select.shadowCol, blurRadius: 6)
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("asset/MainPagePhoto/Share.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            "Paýlaş",
                            style: CustomTextStyle.productfotterPrice(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  quit() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Color.fromRGBO(250, 250, 250, 1),
            title: Center(
                child: Text(
              "Paýlaşmagyň görnüşini saýlaň",
              style: CustomTextStyle.quit(context),
            )),
            actions: [
              ButtonBar(
                buttonHeight: 40,
                buttonMinWidth: 115,
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: select.mainColo,
                    onPressed: () {},
                    child: Text("Ozüm üçin"),
                  ),
                  RaisedButton(
                    color: select.mainColo,
                    onPressed: () {},
                    child: Text("Dostym bilen"),
                  )
                ],
              )
            ],
          );
        });
  }
}
