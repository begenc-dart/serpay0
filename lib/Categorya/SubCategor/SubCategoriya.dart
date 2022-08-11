import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serpay/Categorya/Categoriya/CategoriyaModel.dart';

import '../../IpAdress.dart';
import '../../Model/TextColor.dart';
import '../Categoriya/Categoriya.dart';
import '../Model/CategpriyaModel.dart';
import 'SubCategorProduct.dart';

class Subcategoriya extends StatefulWidget {
  List<Subcategory> subCate;
CategoriyaModel cate;
  Subcategoriya({required this.subCate,required this.cate});

  @override
  _SubcategoriyaState createState() => _SubcategoriyaState();
}

class _SubcategoriyaState extends State<Subcategoriya> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 146,
      width: MediaQuery.of(context).size.width - 110,
      child: GridView.extent(
        maxCrossAxisExtent: 100,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        shrinkWrap: true,
        children: List.generate(
          widget.subCate.length + 1,
          (index) {
            return index != 0
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubCategorProduct(
                                    sort: 0,
                                    subcatId:
                                        widget.subCate[index - 1].subcategoryId,
                                    checkpage: true,
                                    nameSubCat:
                                        widget.subCate[index - 1].nameTm,
                                    page: 0,
                                  )));
                    },
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          imageUrl: "${IpAddress().ipAddress}/" +
                              widget.subCate[index - 1].image,
                          placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(
                                color: Colors.red,
                              )),
                          errorWidget: (context, url, error) =>
                              Image.asset("asset/Img/banner-img.jpg"),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            widget.subCate[index - 1].nameTm,
                            style: CustomTextStyle.cateprostyle(context),
                          ),
                        )
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CateProduct(
                                    sort: 0,
                                    subcatId:
                                       widget.cate.categoryId,
                                    checkpage: true,
                                    nameSubCat:
                                        widget.cate.nameTm,
                                    page: 0,
                                  )));
                    },
                    child: Column(
                      children: [
                        Image.asset("asset/Img/banner-img.jpg"),
                        // CachedNetworkImage(
                        //   imageUrl:
                        //   "${IpAddress().ipAddress}/" +
                        //       widget.subCate[index]
                        //           .image,
                        //   placeholder: (context, url) =>
                        //       Container(
                        //           alignment:
                        //           Alignment.center,
                        //           child:
                        //           CircularProgressIndicator(
                        //             color: Colors.red,
                        //           )),
                        //   errorWidget: (context, url,
                        //       error) =>
                        //       Image.asset(
                        //           "asset/Img/banner-img.jpg"),
                        //   fit: BoxFit.fill,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            "All ",
                            style: CustomTextStyle.cateprostyle(context),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
