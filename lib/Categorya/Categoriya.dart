import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/Categorya/Model/CategpriyaModel.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../Search/Search/Search.dart';
import 'SubCategor/SubCategoriya.dart';
import 'package:http/http.dart' as http;

class Categoriya extends StatefulWidget {
  const Categoriya({Key? key}) : super(key: key);

  @override
  _CategoriyaState createState() => _CategoriyaState();
}

class _CategoriyaState extends State<Categoriya> {

  Colrs select = Colrs();
  Future<List<CategoriyaModel>>? categoriya;
int a=0;
  Future<List<CategoriyaModel>> caregoriyaAlbum() async {
    final response =
        await http.get(Uri.parse("${IpAddress().ipAddress}/public/categories"));

    if (response.statusCode == 200) {
      List<CategoriyaModel> a = (json.decode(response.body) as List)
          .map((e) => CategoriyaModel.fromJson(e))
          .toList();

      return a;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    categoriya = caregoriyaAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: () {
                showSearch(
                    context: context,
                    // delegate to customize the search bar
                    delegate: CustomSearchDelegate());
              },
              child: Container(
                margin: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 10),
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 40,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : select.searh,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: CustomTextStyle.searchStyle(context),
                    ),
                    SvgPicture.asset("asset/icon/qr.svg")
                  ],
                ),
              ),
            ),
            Row(
              children: [
                FutureBuilder(
                    future: categoriya,
                    builder: (context,
                        AsyncSnapshot<List<CategoriyaModel>> snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height - 146,
                              width: 110,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Color.fromRGBO(55, 55, 55, 1)
                                  : select.searh,
                              child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return InkWell(
                                        onTap: () {
                                          setState(() {
                                            a = index;
                                          });
                                        },
                                        child: index == a
                                            ? Container(
                                                height: 60,
                                                color: ThemeServices().theme ==
                                                        ThemeMode.dark
                                                    ? Color.fromRGBO(97, 97, 97, 1)
                                                    : select.scaf,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      width: 5,
                                                      height: 40,
                                                      color: select.mainColo,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                          snapshot
                                                              .data![index].nameTm,
                                                          style: CustomTextStyle
                                                              .cateStyle(context)),
                                                    ),
                                                  ],
                                                ))
                                            : Container(
                                                margin: EdgeInsets.all(15),
                                                height: 60,
                                                child: Center(
                                                  child: Text(
                                                    snapshot.data![index].nameTm,
                                                    style:
                                                        CustomTextStyle.cateStyle(
                                                            context),
                                                  ),
                                                )));
                                  }),
                            ),
                            Subcategoriya(subCate: snapshot.data![a].subcategories!,cate: snapshot.data![a],)
                          ],
                        );
                      } else {
                        debugPrint(snapshot.data.toString());
                        return CircularProgressIndicator();
                      }
                    }),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
