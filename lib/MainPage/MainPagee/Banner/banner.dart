import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpay/IpAdress.dart';

import '../../../Model/TextColor.dart';
import '../../MainChangeNoti.dart';
import '../../Model/BannerProductModel.dart';
import 'package:http/http.dart' as http;

class BannerMainPage extends StatefulWidget {
  @override
  State<BannerMainPage> createState() => _BannerMainPageState();
}

class _BannerMainPageState extends State<BannerMainPage> {
  late Future<BannerProdcut> banner;
  late BannerProdcut bannerProductModel;
  Future<BannerProdcut> fetchAlbum() async {
    final response = await http
        .get(Uri.parse("${IpAddress().ipAddress}/public/banners"));

    var decodedJson = json.decode(response.body);
    bannerProductModel = BannerProdcut.fromJson(decodedJson);

    return bannerProductModel;
  }


  @override
  void initState() {
    banner = fetchAlbum();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final myprice = Provider.of<BannerIndex>(context);
    return FutureBuilder(
        future: banner,
        builder: (context, AsyncSnapshot<BannerProdcut> snapshot) {
          if (snapshot.hasData) {

            return Stack(
              children: [
                CarouselSlider.builder(
                  itemCount:snapshot.data!.banners.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          child: (snapshot.data!.banners[itemIndex].image != null)
                              ? InkWell(
                                  onTap: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //            Categoriya()));
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CachedNetworkImage(
                                      imageUrl: "${IpAddress().ipAddress}/"+snapshot.data!.banners[itemIndex].image,

                                      placeholder: (context, url) => Container(
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            color: select.mainColo,
                                          )),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              "asset/Img/banner-img.jpg"),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              : Image.asset("asset/Img/banner-img.jpg")),
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 200,
                    aspectRatio: 16 / 9,
                    onPageChanged: (index, reason) {
                      myprice.check(index);
                      // setState(() {
                      //   currentPos = index;
                      // });
                    },
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 10),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.banners.map((url) {
                      int index = snapshot.data!.banners.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: myprice.sana == index
                              ? select.mainColo
                              : select.bannerOffColor,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            debugPrint(snapshot.toString());
            return CircularProgressIndicator();
          }
        });
  }
}
