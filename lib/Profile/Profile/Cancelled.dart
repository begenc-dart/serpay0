import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../MainPage/PhotoIndex.dart';


class Cancelled extends StatelessWidget {

  @override
  List photoProduct = [
    "https://dlcdnrog.asus.com/rog/media/1610705538274.jpg",
    "https://dlcdnrog.asus.com/rog/media/1539690389456.jpg",
    "https://www.sentinels.gg/s/SEN-Championship-Mood.png"
  ];


  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);

    return  Scaffold(
      appBar: AppBar(

        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          "Orders History",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ThemeServices().theme==ThemeMode.dark?Colors.white:Color.fromRGBO(39, 39, 39, 1)),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(48, 48, 48, 1):Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "13/05/2022",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1): Color.fromRGBO(71, 71, 71, 1)),
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                      for (int i = 0; i < 3; i++)
                        Padding(
                          padding: EdgeInsets.only(top: 7),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(229, 229, 229, 1),
                                    width: 1),
                                borderRadius: BorderRadius.circular(5),
                                color:  ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Color.fromRGBO(243, 243, 243, 1),),
                            child: Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Stack(
                                        children: [
                                          CarouselSlider.builder(
                                            itemCount: photoProduct.length,
                                            itemBuilder: (BuildContext context,
                                                int itemIndex,
                                                int pageViewIndex){

                                              return Container(
                                                  width: 120,
                                                  child: (photoProduct[
                                                  itemIndex] !=
                                                      null)
                                                      ? ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(5),
                                                    child: CachedNetworkImage(
                                                      imageUrl: photoProduct[itemIndex],

                                                      placeholder: (context, url) =>
                                                          Container(
                                                              alignment:
                                                              Alignment.center,
                                                              child:
                                                              CircularProgressIndicator(
                                                                color: Colors.red,
                                                              )),
                                                      errorWidget: (context, url,
                                                          error) =>
                                                          Image.asset(
                                                              "asset/Img/banner-img.jpg"),
                                                      fit: BoxFit.fill ,
                                                    ),
                                                  )
                                                      : Image.asset(
                                                      "assets/images/1.jpg"));},
                                            options: CarouselOptions(
                                              viewportFraction: 1,
                                              aspectRatio: 16 / 9,
                                              height: 100,
                                              onPageChanged: (index, reason) {
                                                productIndex.check(index);
                                              },
                                              initialPage: 0,
                                              enableInfiniteScroll: true,
                                              reverse: false,
                                              autoPlay: false,
                                              autoPlayInterval:
                                              Duration(seconds: 10),
                                              autoPlayAnimationDuration:
                                              Duration(milliseconds: 800),
                                              autoPlayCurve: Curves.fastOutSlowIn,
                                              enlargeCenterPage: true,
                                              scrollDirection: Axis.horizontal,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 5,
                                            width:
                                            MediaQuery.of(context).size.width /
                                                2 -
                                                60,
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: photoProduct.map((url) {
                                                int index =
                                                photoProduct.indexOf(url);
                                                return Container(
                                                  width: 3.0,
                                                  height: 3.0,
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 10.0,
                                                      horizontal: 3.0),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: productIndex.sana == index
                                                        ? Color.fromRGBO(
                                                        85, 85, 85, 1)
                                                        : Color.fromRGBO(
                                                        221, 221, 221, 1),
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 10, top: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "1831",
                                                        style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 20, 29, 1),),
                                                      ),
                                                      Container(
                                                        width: 30,
                                                        height: 15,
                                                        margin: EdgeInsets.only(
                                                            left: 7),
                                                        decoration: BoxDecoration(
                                                            color: Color.fromRGBO(
                                                                196, 196, 196, 1),
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(2)),
                                                        alignment: Alignment.center,
                                                        child: Text(
                                                          "TMT",
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.w600,
                                                              fontSize: 10,
                                                              color: Color.fromRGBO(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  1)),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 26,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(2),
                                                    border: Border.all(
                                                        color: Color.fromRGBO(
                                                            41, 41, 41, 1),
                                                        width: 0.8),
                                                  ),
                                                  child: Text(
                                                    "x4",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w600,
                                                        fontSize: 14,
                                                        color:  Color.fromRGBO(174, 174, 174, 1)),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Text(
                                              "Beko Washing Machine",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(250, 250, 250, 1): Color.fromRGBO(84, 84, 84, 1)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: -5,
                                  left: -33,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(15 / 360),
                                    child: Container(
                                      width: 63,height: 38,
                                      alignment: Alignment.bottomRight,
                                      padding: EdgeInsets.only(right: 5,bottom: 5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromRGBO(255, 199, 0, 1),),
                                      child: Text("New",style: TextStyle(fontSize: 8,fontWeight: FontWeight.w700),),

                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -20,
                                  left: -25,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(15 / 360),
                                    child: Container(
                                      width: 63,height: 38,
                                      alignment: Alignment.bottomRight,
                                      padding: EdgeInsets.only(right: 5,bottom: 5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color.fromRGBO(255, 20, 29, 1),),
                                      child: Text("-20%",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w700,color: Colors.white),),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                );
              },
              // 40 list items
              childCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}
