import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Liked/get_liked_body.dart';
import 'package:serpay/Liked/liked.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:http/http.dart' as http;
import '../../LogIn/LogIn/Model/token.dart';
import '../../MainPage/PhotoIndex.dart';
class WishLike extends StatefulWidget {

  @override
  State<WishLike> createState() => _WishLikeState();
}

class _WishLikeState extends State<WishLike> {
  // List photoProduct = [
  int current_page = 0;

late  LikedBodyGet likedBodyGet;

  List<LikedProduct> prod = [];
  String? token;
  Future<bool> fetchAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    if (isrefest) {
      current_page = 0;
    }

    final response = await http.get(Uri.parse("${IpAddress().ipAddress}/users/like?offset=$current_page"

       ),headers: <String, String>{
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${token}',
    },);

    debugPrint(response.body.toString());
    if (response.statusCode == 200) {
      debugPrint(response.statusCode.toString());
      likedBodyGet = likedBodyGetFromJson(response.body);

      debugPrint(response.statusCode.toString());
      debugPrint(response.body.toString());
      if (isrefest) {
        prod = likedBodyGet.likedProduct!;
      } else {
        prod.addAll(likedBodyGet.likedProduct!);
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          "Wishlist",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await fetchAlbum(isrefest: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await fetchAlbum();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index){
                    return  Padding(
                      padding: EdgeInsets.only(top: 10,left: 15,right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromRGBO(229, 229, 229, 1),
                              width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color:  ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(48, 48, 48, 1):Colors.white,),
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
                                        itemCount: prod[index].images.length,
                                        itemBuilder: (BuildContext context,
                                            int itemIndex,
                                            int pageViewIndex){

                                          return Container(
                                              width: 120,
                                              child: (prod[itemIndex].images != null)
                                                  ? ClipRRect(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(5),
                                                child: CachedNetworkImage(
                                                  imageUrl: "${IpAddress().ipAddress}/${prod[itemIndex].images}",

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
                                      // Positioned(
                                      //   bottom: 5,
                                      //   width:
                                      //   MediaQuery.of(context).size.width /
                                      //       2 -
                                      //       60,
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //     MainAxisAlignment.center,
                                      //     children: prod[itemIndex].images.map((url) {
                                      //       int myIndex =
                                      //       prod[itemIndex].images.indexOf(url);
                                      //       return Container(
                                      //         width: 3.0,
                                      //         height: 3.0,
                                      //         margin: EdgeInsets.symmetric(
                                      //             vertical: 10.0,
                                      //             horizontal: 3.0),
                                      //         decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: productIndex.sana == myIndex
                                      //               ? Color.fromRGBO(
                                      //               85, 85, 85, 1)
                                      //               : Color.fromRGBO(
                                      //               221, 221, 221, 1),
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
                                                    prod[index].price.toString(),
                                                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Color.fromRGBO(255, 20, 29, 1)),
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
                                                      "manat",
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
                                            SvgPicture.asset("asset/icon/Like_on.svg")
                                          ],
                                        ),
                                        Text(
                                          prod[index].nameTm,
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
                    );
                  },
                  childCount: prod.length
              ),)
          ],
        ),
      )
    );
  }
}
