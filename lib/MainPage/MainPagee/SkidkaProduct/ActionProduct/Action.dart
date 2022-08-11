import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/ActionProduct/ActionGrid.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/ActionProduct/ActionList.dart';
import 'package:serpay/MainPage/Model/Action.dart';

import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/TextColor.dart';

import 'package:http/http.dart' as http;

import '../../../../IpAdress.dart';
import '../../../../LogIn/LogIn/Model/checkSignUp.dart';
import '../../../../LogIn/LogIn/Model/token.dart';
import '../../../../Search/Filter.dart';
import '../../../../darkMode/theme_services.dart';

import '../../../Product/Product.dart';

class ActionProducts extends StatefulWidget {
  int sort;
  int page;
  bool checkpage;

  ActionProducts(
      {required this.sort, required this.page, required this.checkpage});

  @override
  State<ActionProducts> createState() => _ActionProductsState();
}

class _ActionProductsState extends State<ActionProducts> {
  late int totalPage;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late ActionModel actionModel;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  List<ActionProduct> prod = [];
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();

  String checkLike = "";

  Future<bool> fetchAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    if (isrefest) {
      current_page = 0;
    }

    final response = await http.get(
      Uri.parse(checkLike.toString().length == 4
          ? widget.sort == 0
              ? "$ip/users/products/action?offset=$current_page"
              : widget.sort == 1
                  ? "$ip/users/products/action?offset=$current_page&sort=1"
                  : "$ip/users/products/action?offset=$current_page&sort=0"
          : widget.sort == 0
              ? "$ip/public/products/action?offset=$current_page"
              : widget.sort == 1
                  ? "$ip/public/products/action?offset=$current_page&sort=1"
                  : "$ip/public/products/action?offset=$current_page&sort=0"),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${token}',
            }
          : {},
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {

      actionModel = actionModelFromJson(response.body);

      debugPrint(response.statusCode.toString());
      if (isrefest) {
        prod = actionModel.actionProducts!;
      } else {
        prod.addAll(actionModel.actionProducts!);
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Action harytlar",
            style: CustomTextStyle.profiledettails(context),
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
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActionProducts(
                                          sort: 0,
                                          page: 0,
                                          checkpage: widget.checkpage,
                                        )));
                            setState(() {});
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: widget.page != 0
                                    ? Border.all(color: select.searchtop)
                                    : Border.all(color: select.mainColo),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Arzanladyşlar",
                              style: CustomTextStyle.discount(context),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.sort == 2
                                ? Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActionProducts(
                                              sort: 1,
                                              page: 1,
                                              checkpage: widget.checkpage,
                                            )))
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActionProducts(
                                              sort: 2,
                                              page: 1,
                                              checkpage: widget.checkpage,
                                            )));
                            setState(() {});
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: widget.page != 1
                                    ? Border.all(color: select.searchtop)
                                    : Border.all(color: select.mainColo),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Baha",
                                  style: CustomTextStyle.discount(context),
                                ),
                                SvgPicture.asset(
                                  "asset/MainPagePhoto/Group 337.svg",
                                  color: ThemeServices().theme == ThemeMode.dark
                                      ? Color.fromRGBO(250, 250, 250, 1)
                                      : Color.fromRGBO(41, 41, 41, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.checkpage == true
                                ? widget.checkpage = false
                                : widget.checkpage = true;
                            fetchAlbum(isrefest: true);
                            setState(() {});
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: Border.all(color: select.searchtop),
                                borderRadius: BorderRadius.circular(5)),
                            child: widget.checkpage == false
                                ? SvgPicture.asset(
                                    "asset/MainPagePhoto/Group 87.svg",
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(250, 250, 250, 1)
                                            : Color.fromRGBO(41, 41, 41, 1),
                                  )
                                : SvgPicture.asset(
                                    "asset/MainPagePhoto/Group 88.svg",
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(250, 250, 250, 1)
                                            : Color.fromRGBO(41, 41, 41, 1),
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Filter()));
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: Border.all(color: select.searchtop),
                                borderRadius: BorderRadius.circular(5)),
                            child: SvgPicture.asset(
                              "asset/MainPagePhoto/Vector (1).svg",
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Color.fromRGBO(250, 250, 250, 1)
                                  : Color.fromRGBO(41, 41, 41, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
                widget.checkpage == true
                    ? ActionList(actionProduct: prod)
                    : ActionGrid(actionProduct: prod)
              ],
            )));
  }
}
