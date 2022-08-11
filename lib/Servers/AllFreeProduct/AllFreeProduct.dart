import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:provider/provider.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Servers/AllFreeProduct/FreeListProduct.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../MainPage/PhotoIndex.dart';

class AllFreeProd extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1): Color.fromRGBO(250, 250, 250, 1),
      title: Text(
          "Paylaş we Mugt Gazan",
          style: CustomTextStyle.filterTop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [select.mainColo, select.freeProd],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.25),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                            "asset/MainPagePhoto/Group 42.svg"),
                      ),
                      time("04"),
                      Text(
                        ":",
                        style: CustomTextStyle.DiscoutDot(context),
                      ),
                      time("15"),
                      Text(
                        ":",
                        style: CustomTextStyle.DiscoutDot(context),
                      ),
                      time("30"),
                      SizedBox(
                        width: 12,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ])),
FreeListProduct()
        ],
      ),
    );
  }

  time(String time) {
    return Container(
      width: 38,
      height: 36,
      decoration: BoxDecoration(
        color: select.tmcolo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(
        time,
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Color.fromRGBO(0, 0, 0, 1)),
      )),
    );
  }
}
