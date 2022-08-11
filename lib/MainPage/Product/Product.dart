import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/MainPage/Product/AppBarProduct/AppBarProduct.dart';
import 'package:serpay/MainPage/Product/FotterProduct/FutterProduct.dart';
import 'package:serpay/MainPage/Product/ProductRealted/ProductRelated.dart';
import 'package:serpay/MainPage/Product/ProtuctText/ProductText.dart';
import 'package:serpay/Model/TextColor.dart';

import 'package:http/http.dart' as http;
import '../../IpAdress.dart';
import '../../Model/Colors.dart';
import 'ProductDetails/ProductDetails.dart';

class ProductDetails extends StatefulWidget {
  String productId;
  ProductDetails({required this.productId});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentPos = 0;
  Colrs select = Colrs();
  Future<ProductModel>? veri;
  ProductModel? productModel;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
  String ip = IpAddress().ipAddress;
  Future<ProductModel> fetchAlbum() async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    final response =
        await http.get(Uri.parse(
            checkLike.toString().length == 4 ?
            "$ip/users/products/${widget.productId}":"$ip/public/products/${widget.productId}"),
          headers: checkLike.toString().length.toInt() == 4
              ? <String, String>{
            "Content-Type": "application/json",
            'Authorization': 'Bearer ${token}',
          } : {},);

    var decodedJson = json.decode(response.body);
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());

    productModel = ProductModel.fromJson(decodedJson);
    (productModel.toString());
    return productModel!;
  }

  @override
  void initState() {
    // TODO: implement initState
    veri = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("fsdfsd");

    return SafeArea(
      child: Scaffold(
          body: FutureBuilder(
              future: veri,
              builder: (context, AsyncSnapshot<ProductModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height - 90,
                        child: CustomScrollView(
                          slivers: [
                            AppBarProct(
                              oneProductElement:
                                  snapshot.data!.product.oneProduct,
                            ),
                            ProductText(
                              oneProductElement:
                                  snapshot.data!.product.oneProduct,
                            ),
                            // ProductDetailsPhoto(
                            //   imageDetal:
                            //       snapshot.data!.product!.oneProduct!.details!,
                            // ),
                            ProductText(
                                    oneProductElement:
                                        snapshot.data!.product.oneProduct)
                                .realated(context),
                            SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 300,
                                        childAspectRatio: 16 / 22),
                                delegate: SliverChildBuilderDelegate(
                                    (BuildContext context, int index) {
                                  return  ProductRelated(
                                    index: index,
                                    recommenendations: snapshot
                                        .data!.product.recommenendations,
                                  );
                                },
                                    childCount: snapshot.data!.product
                                        .recommenendations.products!.length)),
                          ],
                        ),
                      ),
                      ProductFotter(
                        oneProductElement: snapshot.data!.product.oneProduct, onpress: setSt,
                      ),
                    ],
                  );
                } else {
                  debugPrint(snapshot.toString());
                  return Text(snapshot.toString());
                }
              })),
    );
  }
  setSt() {
    setState(() {

    });
  }
}
