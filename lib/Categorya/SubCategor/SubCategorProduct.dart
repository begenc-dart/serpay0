import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/Categorya/SubCategor/SubCategorGrid.dart';
import 'package:serpay/Categorya/SubCategor/SubCategorList.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:http/http.dart' as http;
import '../../../../../IpAdress.dart';
import '../../../../../Search/Filter.dart';
import '../../../../../darkMode/theme_services.dart';
import '../Model/SubCategoriesProduct.dart';

class SubCategorProduct extends StatefulWidget {
  int sort;
  int page;
  bool checkpage;
  String subcatId;
  String nameSubCat;

  SubCategorProduct(
      {required this.sort,
      required this.page,
      required this.checkpage,
      required this.subcatId,
      required this.nameSubCat});

  @override
  State<SubCategorProduct> createState() => _SubCategorProductState();
}

class _SubCategorProductState extends State<SubCategorProduct> {
  late int totalPage;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late SubCategoriyaProduct _subCategoriyaProduct;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  List<ProductSub> prod = [];

  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();

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

    final response = await http.get(Uri.parse(
        checkLike.toString().length == 4 ?
        widget.sort == 0
        ? "$ip/users/products/sub-categories/${widget.subcatId}?offset=$current_page"
        : widget.sort == 1
            ? "$ip/users/products/sub-categories/${widget.subcatId}?offset=$current_page&sort=1"
            : "$ip/users/products/sub-categories/${widget.subcatId}?offset=$current_page&sort=0"
        :widget.sort == 0
            ? "$ip/public/sub-categories/products/${widget.subcatId}?offset=$current_page"
            : widget.sort == 1
            ? "$ip/public/sub-categories/products/${widget.subcatId}?offset=$current_page&sort=1"
            : "$ip/public/sub-categories/products/${widget.subcatId}?offset=$current_page&sort=0"),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      }
      : {},
    );
    debugPrint(response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {
      (response.statusCode.toString());
      _subCategoriyaProduct = subCategoriyaProductFromJson(response.body);

      (response.statusCode.toString());
      if (isrefest) {
        prod = _subCategoriyaProduct.products!;
      } else {
        prod.addAll(_subCategoriyaProduct.products!);
      }
      ("new");
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
            widget.nameSubCat.toString(),
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
                                    builder: (context) => SubCategorProduct(
                                          sort: 0,
                                          page: 0,
                                          checkpage: widget.checkpage,
                                          subcatId: widget.subcatId,
                                          nameSubCat: widget.nameSubCat,
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
                                        builder: (context) => SubCategorProduct(
                                              sort: 1,
                                              page: 1,
                                              checkpage: widget.checkpage,
                                              nameSubCat: widget.nameSubCat,
                                              subcatId: widget.subcatId,
                                            )))
                                : Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SubCategorProduct(
                                              sort: 2,
                                              page: 1,
                                              checkpage: widget.checkpage,
                                              nameSubCat: widget.nameSubCat,
                                              subcatId: widget.subcatId,
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
                    ? SubCategorList(brend: prod)
                    : SubCategorGrid(brend: prod)
              ],
            )));
  }
}
