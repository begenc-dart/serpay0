import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';
import '../../PhotoIndex.dart';
import '../Product.dart';

class ProductRelated extends StatelessWidget {
  int index;
  Recommenendations recommenendations;
  ProductRelated({required this.index, required this.recommenendations});

  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);

    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetails(
                productId: recommenendations.products![index].productId)));
      },
      child: Container(
        margin: index % 2 == 0
            ? EdgeInsets.only(left: 15, top: 15)
            : EdgeInsets.only(right: 15, top: 15, left: 15),
        decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(250, 250, 250, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      child: Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: recommenendations
                                .products![index].images!.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: recommenendations.products![index]
                                                .images!.length !=
                                           0
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                topLeft: Radius.circular(10)),
                                            child: CarouselSlider.builder(
                                              itemCount:recommenendations.products![index]
                                                  .images!.length,
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
                                                            recommenendations.products![index]
                                                              .images![itemIndex].image,
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
                                                              "asset/Img/banner-img.jpg",fit: BoxFit.fill,),
                                                        fit:
                                                        BoxFit.fill,
                                                      ),
                                                    ));
                                              },
                                              options: CarouselOptions(
                                                viewportFraction: 1,
                                                aspectRatio: 16 / 9,
                                                height: 115,
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
                                          )
                                        : Image.asset("asset/Img/banner-img.jpg")),
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: MediaQuery.of(context).size.height,
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
                            width: MediaQuery.of(context).size.width / 2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: recommenendations
                                  .products![index].images
                                  !.map((url) {
                                int indexpro = recommenendations
                                    .products![index].images
                                    !.indexOf(url);
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(recommenendations
                          .products![index].nameTm.toString(),
                          style: CustomTextStyle.nameTm(context)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(recommenendations.products![index].bodyTm,
                          style: CustomTextStyle.desStyle(context)),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                recommenendations.products![index].price
                                    .toString(),
                                style: CustomTextStyle.priceColor(context),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: 22,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: select.tmConCol,
                                    borderRadius: BorderRadius.circular(2)),
                                child: Center(
                                  child: Text("TMT",
                                      style: CustomTextStyle.TmCol(context)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                              recommenendations.products![index].priceOld
                                      .toString() +
                                  " TMT",
                              style: CustomTextStyle.disprice(context),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ProductLike(
                  like: recommenendations.products![index].isLiked,
                  id: recommenendations.products![index].productId
              ),
              Positioned(
                top: recommenendations.products![index].discount != null
                    ? -5
                    : -25,
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
              recommenendations.products![index].discount != null
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
                            color: select.mainColo,
                          ),
                          child: Text(
                            "-${recommenendations.products![index].discount}%",
                            style: CustomTextStyle.disColor(context),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
