import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../MainPage/PhotoIndex.dart';
import '../../../MainPage/Product/Product.dart';
import '../../../Model/TextColor.dart';

class GridProduct extends StatelessWidget {
  List photoProduct = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
    "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
    "https://wallpapercave.com/wp/wp5187178.jpg"
  ];
  int grvalue = 1;
  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) => InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProductDetails(
                          productId: "",
                        )));
              },
              child: Container(
                height: 200,
                margin: index % 2 == 0
                    ? EdgeInsets.only(left: 15, top: 15)
                    : EdgeInsets.only(right: 15, top: 15, left: 15),
                decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : select.scaf,
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 7,
                              child: Stack(
                                children: [
                                  CarouselSlider.builder(
                                    itemCount: photoProduct.length,
                                    itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) =>
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: (photoProduct[itemIndex] !=
                                                    null)
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(10),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10)),
                                                    child: CachedNetworkImage(
                                                      imageUrl: photoProduct[
                                                          itemIndex],
                                                      placeholder: (context,
                                                              url) =>
                                                          Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: select
                                                                    .mainColo,
                                                              )),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                              "asset/Img/banner-img.jpg"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                                : Image.asset(
                                                    "assets/images/1.jpg")),
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      aspectRatio: 16 / 9,
                                      onPageChanged: (index, reason) {
                                        productIndex.check(index);

                                        // setState(() {
                                        //   currentPos = index;
                                        // });
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
                                        MediaQuery.of(context).size.width / 2,
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
                                                ? select.desColor
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
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Text("iPhone 13 Pro Max...",
                                    style: CustomTextStyle.desStyle(context)),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "18310",
                                          style: CustomTextStyle.priceColor(
                                              context),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          width: 22,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              color: select.tmConCol,
                                              borderRadius:
                                                  BorderRadius.circular(2)),
                                          child: Center(
                                            child: Text("TMT",
                                                style: CustomTextStyle.TmCol(
                                                    context)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 17),
                                      child: Text(
                                        "1876TMT",
                                        style:
                                            CustomTextStyle.disprice(context),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                            right: 10,
                            top: 10,
                            child: SvgPicture.asset("asset/icon/like.svg")),
                        Positioned(
                          top: -5,
                          left: -33,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(15 / 360),
                            child: Container(
                              width: 63,
                              height: 38,
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(right: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: select.newconcol,
                              ),
                              child: Text(
                                "New",
                                style: CustomTextStyle.newStle(context),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -20,
                          left: -25,
                          child: RotationTransition(
                            turns: new AlwaysStoppedAnimation(15 / 360),
                            child: Container(
                              width: 63,
                              height: 38,
                              alignment: Alignment.bottomRight,
                              padding: EdgeInsets.only(right: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: select.mainColo,
                              ),
                              child: Text(
                                "-20%",
                                style: CustomTextStyle.disColor(context),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, childAspectRatio: 16 / 20));
  }
}
