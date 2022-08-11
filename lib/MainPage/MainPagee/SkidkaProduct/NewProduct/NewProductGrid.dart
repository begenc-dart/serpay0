import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';

import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';
import '../../../Model/mainModel.dart';
import '../../../Product/Product.dart';
import '../../model/HistoryProduct.dart';
class NewProductGrid extends StatelessWidget {
  List<NewProductElement> newProduct;
  NewProductGrid({required this.newProduct});


  @override
  Widget build(BuildContext context) {
    return  SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () {
              HistoryProduct().history(newProduct[index].productId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productId: newProduct[index].productId,
                  )));
            },
            child: Container(
              height: 200,
              margin: index % 2 == 0
                  ? EdgeInsets.only(left: 15, top: 15)
                  : EdgeInsets.only(
                  right: 15, top: 15, left: 15),
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
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              newProduct[index].images.length != 0
                                  ? CarouselSlider.builder(
                                itemCount: newProduct[index]
                                    .images
                                    .length,
                                itemBuilder: (BuildContext
                                context,
                                    int itemIndex,
                                    int pageViewIndex) {
                                  return Container(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                        child:
                                        CachedNetworkImage(
                                          imageUrl: "${IpAddress().ipAddress}/" +
                                              newProduct[index]
                                                  .images[
                                              itemIndex]
                                                  .image,
                                          placeholder: (context,
                                              url) =>
                                              Container(
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  child:
                                                  CircularProgressIndicator(
                                                    color:
                                                    Colors.red,
                                                  )),
                                          errorWidget: (context,
                                              url,
                                              error) =>
                                              Image.asset(
                                                  "asset/Img/banner-img.jpg"),
                                          fit:
                                          BoxFit.contain,
                                        ),
                                      ));
                                },
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  aspectRatio: 16 / 9,
                                  height: 120,
                                  // onPageChanged: (index, reason) {
                                  //   productIndex.check(index);
                                  // },
                                  initialPage: 0,
                                  enableInfiniteScroll:
                                  true,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval:
                                  Duration(
                                      seconds: 10),
                                  autoPlayAnimationDuration:
                                  Duration(
                                      milliseconds:
                                      800),
                                  autoPlayCurve: Curves
                                      .fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  scrollDirection:
                                  Axis.horizontal,
                                ),
                              )
                                  : Image.asset(
                                  "asset/Img/banner-img.jpg"),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(newProduct[index].nameTm,
                                maxLines: 1,
                                style: CustomTextStyle.nameTm(
                                    context)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(newProduct[index].bodyTm,
                                maxLines: 1,
                                style: CustomTextStyle.desStyle(
                                    context)),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 5, left: 10, bottom: 5),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      newProduct[index]
                                          .price
                                          .toString(),
                                      style: CustomTextStyle
                                          .priceColor(context),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5),
                                      width: 22,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color:
                                          select.tmConCol,
                                          borderRadius:
                                          BorderRadius
                                              .circular(2)),
                                      child: Center(
                                        child: Text("TMT",
                                            style: CustomTextStyle
                                                .TmCol(
                                                context)),
                                      ),
                                    ),
                                  ],
                                ),
                                newProduct[index].discount != null
                                    ? Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      right: 17),
                                  child: Text(
                                    "${newProduct[index].priceOld} TMT",
                                    style: CustomTextStyle
                                        .disprice(
                                        context),
                                  ),
                                )
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                      ProductLike(
                          like: newProduct[index].isLiked,
                          id: newProduct[index].productId
                      ),
                      Positioned(
                        top: newProduct[index].discount != null
                            ? -5
                            : -25,
                        left: -33,
                        child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(
                              15 / 360),
                          child: Container(
                            width: 63,
                            height: 38,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(
                                right: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              color: select.newconcol,
                            ),
                            child: Text(
                              "New",
                              style: CustomTextStyle.newStle(
                                  context),
                            ),
                          ),
                        ),
                      ),
                      newProduct[index].discount != null
                          ? Positioned(
                        top: -20,
                        left: -25,
                        child: RotationTransition(
                          turns:
                          new AlwaysStoppedAnimation(
                              15 / 360),
                          child: Container(
                            width: 63,
                            height: 38,
                            alignment:
                            Alignment.bottomRight,
                            padding: EdgeInsets.only(
                                right: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                              color: select.mainColo,
                            ),
                            child: Text(
                              "-${newProduct[index].discount}%",
                              style: CustomTextStyle
                                  .disColor(context),
                            ),
                          ),
                        ),
                      )
                          : Container()
                    ],
                  ),
                ),
              ),
            ),
          ),
          childCount: newProduct.length,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, childAspectRatio: 18 / 20));
  }
}
