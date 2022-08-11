import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:serpay/MainPage/MainPagee/Aksiya/Aksiya.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/Discount/DiscountProduct.dart';
import 'package:serpay/MainPage/MainPagee/search/Search.dart';

import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/checkSignUp.dart';
import '../../LogIn/LogIn/Model/token.dart';
import '../../Model/Colors.dart';

import '../../Model/TextColor.dart';
import '../../Search/Search/SliverGrid/SliverGrid.dart';

import '../../darkMode/theme_services.dart';
import '../../main.dart';
import '../Model/RandomProduct.dart';
import '../PhotoIndex.dart';
import '../Product/Product.dart';
import 'Banner/banner.dart';
import 'Skidka/Skidka.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPos = 0;

  List photoProduct = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
    "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
    "https://wallpapercave.com/wp/wp5187178.jpg"
  ];

  Colrs select = Colrs();

  int current_page = 0;

  String ip = IpAddress().ipAddress;

  List<RandomProduct> randomProduct = [];

  List<RandomProduct> prod = [];
  String? token;

  Future<bool> bannerAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await  checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    if (isrefest) {
      current_page = 0;
    }
    final response = await http.get(Uri.parse(checkLike.toString().length == 4
        ? "${ip}/users/products?offset=$current_page"
        : "${ip}/public/products?offset=$current_page"),
        headers:checkLike.toString().length.toInt() == 4 ?  <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        }:{},
     );
    debugPrint(response.body.toString());
    debugPrint(checkLike.toString().length.toString() +"begenc");
    if (response.statusCode == 200) {
      (response.statusCode.toString());
      randomProduct = (json.decode(response.body) as List)
          .map((e) => RandomProduct.fromJson(e))
          .toList();

      (response.statusCode.toString());
      if (isrefest) {
        prod = randomProduct;
      } else {
        prod.addAll(randomProduct);
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      throw false;
    }
  }

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  @override
  CheckSignUp checkSignUp = new CheckSignUp();

  String checkLike = "";

  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await bannerAlbum(isrefest: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await bannerAlbum();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        gradient: ThemeServices().theme == ThemeMode.light
                            ? LinearGradient(
                                colors: [select.mainColo, select.gradie],
                                begin: Alignment.center,
                                end: Alignment.bottomRight)
                            : null,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    child: Stack(
                      children: [
                        ThemeServices().theme == ThemeMode.light
                            ? Positioned(
                                child: Image.asset(
                                    "asset/MainPagePhoto/gift-dynamic-gradient (1).png"),
                                right: -70,
                                top: 10,
                              )
                            : Container(),
                        Column(
                          children: [
                            Search(),
                            BannerMainPage(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      ThemeServices().theme == ThemeMode.light
                          ? Positioned(
                              left: -50,
                              child: Image.asset(
                                  "asset/MainPagePhoto/bag-dynamic-color.png"))
                          : Container(),
                      Column(
                        children: [
                          Aksiya(
                              img: "asset/Img/aksiya 1.jpg", namepro: "Aksiýa"),
                          Stack(
                            children: [
                              ThemeServices().theme == ThemeMode.light
                                  ? Positioned(
                                      right: -50,
                                      child: Image.asset(
                                          "asset/MainPagePhoto/headphone-dynamic-color.png"))
                                  : Container(),
                              Column(
                                children: [
                                  Aksiya(
                                    img: "asset/Img/new.jpg",
                                    namepro: "Täzeler",
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, right: 6, top: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ArzanladysProduct(
                                                                  sort: 0,
                                                                  page: 0,
                                                                  checkpage:
                                                                      false)));
                                                },
                                                child: Skidka(
                                                  imgUrl:
                                                      "asset/Img/aksiya.jpg",
                                                  name: "Skidka",
                                                ),
                                              ))),
                                      Expanded(
                                          child: Padding(
                                        padding:
                                            EdgeInsets.only(right: 15, top: 10),
                                        child: Skidka(
                                          imgUrl: "asset/Img/top.jpg",
                                          name: "Top sales",
                                        ),
                                      )),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ProductMainPage(
              randomPro: prod,
            )
          ],
        ),
      ),
    );
  }
}
