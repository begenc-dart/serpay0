import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../MainPage/Model/Action.dart';
import '../../../MainPage/Model/mainModel.dart';
import '../../../MainPage/PhotoIndex.dart';
import '../../../Model/TextColor.dart';

class ProductList extends StatelessWidget {
  List<ActionProduct>? pro;
  ProductList({this.pro});

  @override
  Widget build(BuildContext context) {
    // final productIndex = Provider.of<ProductIndex>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                decoration: BoxDecoration(
                  color: ThemeServices().theme == ThemeMode.dark
                      ? Color.fromRGBO(55, 55, 55, 1)
                      : select.scaf,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              pro![index].images!.length != 0
                                  ? CarouselSlider.builder(
                                      itemCount: pro![index].images!.length,
                                      itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) {
                                        return Container(
                                            width: 120,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "${IpAddress().ipAddress}/" +
                                                        pro![index]
                                                            .images![itemIndex]
                                                            .image,
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
                                                fit: BoxFit.fill,
                                              ),
                                            ));
                                      },
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        aspectRatio: 16 / 9,
                                        height: 100,
                                        // onPageChanged: (index, reason) {
                                        //   productIndex.check(index);
                                        // },
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
                                    )
                                  : Image.asset("asset/Img/banner-img.jpg"),
                              // Positioned(
                              //   bottom: 5,
                              //   width:
                              //       MediaQuery.of(context).size.width / 2 - 60,
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.center,
                              //     children: pro![index].images[].image.map((url) {
                              //       int index = pro![index].images.indexOf(url);
                              //       return Container(
                              //         width: 3.0,
                              //         height: 3.0,
                              //         margin: EdgeInsets.symmetric(
                              //             vertical: 10.0, horizontal: 3.0),
                              //         decoration: BoxDecoration(
                              //           shape: BoxShape.circle,
                              //           color: productIndex.sana == index
                              //               ? select.photodotCol
                              //               : select.photodotOffCol,
                              //         ),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 15, left: 15, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          pro![index].id.toString(),
                                          style: CustomTextStyle.priceColor(
                                              context),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 12,
                                          margin: EdgeInsets.only(left: 8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Color.fromRGBO(
                                                  196, 196, 196, 1)),
                                          child: Center(
                                              child: Text(
                                            "TMT",
                                            style: CustomTextStyle.TmCollist(
                                                context),
                                          )),
                                        ),
                                      ],
                                    ),
                                    pro![index].priceOld != null
                                        ? Text(
                                            "${pro![index].priceOld} TMT",
                                            style: CustomTextStyle.disprice(
                                                context),
                                          )
                                        : Container(),
                                    SvgPicture.asset("asset/icon/like.svg")
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    pro![index].nameTm,
                                    style: CustomTextStyle.nameTm(context),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                    pro![index].bodyTm,
                                    style: CustomTextStyle.desStyle(context),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    pro![index].isNew != null
                        ? Positioned(
                            top: pro![index].discount != null ? -5 : -22,
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
                                  color: Color.fromRGBO(255, 199, 0, 1),
                                ),
                                child: Text(
                                  "ooo",
                                  style: CustomTextStyle.newStle(context),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    pro![index].discount != null
                        ? Positioned(
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
                                  color: Color.fromRGBO(255, 20, 29, 1),
                                ),
                                child: Text(
                                  "-20%",
                                  style: CustomTextStyle.disColor(context),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ]),
                ),
              ),
          childCount: pro!.length),
    );
  }
}
