import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serpay/MainPage/Model/Product.dart';

import '../../../IpAdress.dart';
import '../../../Model/TextColor.dart';

class ProductDetailsPhoto extends StatelessWidget {
  List<Detail> imageDetal;
  ProductDetailsPhoto({required this.imageDetal});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return CachedNetworkImage(
        imageUrl: "${IpAddress().ipAddress}/" + imageDetal[index].image,
        placeholder: (context, url) => Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: select.mainColo,
            )),
        errorWidget: (context, url, error) =>
            Image.asset("asset/Img/banner-img.jpg"),
        fit: BoxFit.fill,
      );
    }, childCount: imageDetal.length));
  }
}
