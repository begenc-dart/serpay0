import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/Search/Filter.dart';
import 'package:serpay/Search/Search/ProductList/ProductList.dart';
import 'package:serpay/Search/Search/SliverGrid/ProductGrid.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../MainPage/Model/Action.dart';
import '../../../MainPage/Model/mainModel.dart';
import '../../../MainPage/PhotoIndex.dart';
import '../../../MainPage/Product/Product.dart';
import '../../../Model/TextColor.dart';

class ProductGrid extends StatefulWidget {
  List<ActionProduct>? pro;
  ProductGrid({this.pro});
  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List photoProduct = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
    "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
    "https://wallpapercave.com/wp/wp5187178.jpg"
  ];

  bool check = false;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return CustomScrollView(
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
                    page = 0;
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
                        border: page != 0
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
                    page = 1;
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
                        border: page != 1
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
                    check == true ? check = false : check = true;
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
                    child: check == false
                        ? SvgPicture.asset(
                            "asset/MainPagePhoto/Group 87.svg",
                            color: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(250, 250, 250, 1)
                                : Color.fromRGBO(41, 41, 41, 1),
                          )
                        : SvgPicture.asset(
                            "asset/MainPagePhoto/Group 88.svg",
                            color: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(250, 250, 250, 1)
                                : Color.fromRGBO(41, 41, 41, 1),
                          ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Filter()));
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
        check == false
            ? ProductList(
                pro: widget.pro!,
              )
            : GridProduct()
      ],
    );
  }
}
