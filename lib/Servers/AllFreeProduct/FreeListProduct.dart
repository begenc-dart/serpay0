import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../MainPage/PhotoIndex.dart';
import '../../Model/TextColor.dart';
import '../FreeProduct.dart';
class FreeListProduct extends StatelessWidget {

  List photoProduct = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
    "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
    "https://wallpapercave.com/wp/wp5187178.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return SliverList(
        delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FreeProduct()));
                  },
                  child: Container(
              width: MediaQuery.of(context).size.width,
              height: 125,
              margin: EdgeInsets.only(top: 15, right: 15, left: 15),
              decoration: BoxDecoration(
                    color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): select.scaf,
                    borderRadius: BorderRadius.circular(10)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: photoProduct.length,
                            itemBuilder: (BuildContext context,
                                int itemIndex, int pageViewIndex) {
                              return Container(
                                  width: 120,
                                  child: (photoProduct[itemIndex] !=
                                      null)
                                      ? ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      photoProduct[itemIndex],
                                      placeholder: (context,
                                          url) =>
                                          Container(
                                              alignment: Alignment
                                                  .center,
                                              child:
                                              CircularProgressIndicator(
                                                color: Colors.red,
                                              )),
                                      errorWidget: (context, url,
                                          error) =>
                                          Image.asset(
                                              "asset/Img/banner-img.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                      : Image.asset(
                                      "assets/images/1.jpg"));
                            },
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
                              autoPlayInterval: Duration(seconds: 10),
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
                            MediaQuery.of(context).size.width / 2 -
                                60,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: photoProduct.map((url) {
                                int index = photoProduct.indexOf(url);
                                return Container(
                                  width: 3.0,
                                  height: 3.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 3.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: productIndex.sana == index
                                        ? select.photodotCol
                                        : select.photodotOffCol,
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 15),
                            child: Text(
                              "Woman Loafer Zara",
                              style:
                              CustomTextStyle.priceRange(context),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: new LinearPercentIndicator(
                              width: 130,
                              animation: true,
                              lineHeight: 10.0,
                              animationDuration: 2000,
                              percent:0.6,
                              center: Text(
                                "60.0%",
                                style: CustomTextStyle.proset(context),
                              ),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              // progressColor: Colors.greenAccent,
                              linearGradient: LinearGradient(colors: [
                                select.freeProd,
                                select.mainColo,
                              ]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "asset/MainPagePhoto/users (1).svg",color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1): Color.fromRGBO(97, 97, 97, 1) ,),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "123",
                                      style: CustomTextStyle
                                          .topPersonShare(context),
                                    ),
                                  )
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  quit(context);
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: select.mainColo,
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          "asset/MainPagePhoto/Share.svg"),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10),
                                        child: Text(
                                          "Paýlaş",
                                          style: CustomTextStyle
                                              .productfotterPrice(
                                              context),
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
                    )
                  ],
              ),
            ),
                ),
            childCount: 10));
  }
  quit(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Colors.white,
        title: Center(child: Text("Paýlaşmagyň görnüşini saýlaň",style: CustomTextStyle.quit(context),)),
        actions: [
          ButtonBar(
            buttonHeight: 40,
            buttonMinWidth: 115,
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              RaisedButton(color: select.mainColo,onPressed: (){},child: Text("Ozüm üçin"),),
              RaisedButton(color: select.mainColo,onPressed: (){},child: Text("Dostym bilen"),)
            ],
          )
        ],
      );

    });
}}
