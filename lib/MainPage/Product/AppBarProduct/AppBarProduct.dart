import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/Model/Product.dart';

import '../../../Model/TextColor.dart';
import '../../PhotoIndex.dart';
import '../../PhotoIndex.dart';

class AppBarProct extends StatelessWidget {
  OneProduct oneProductElement;
  AppBarProct({required this.oneProductElement});
  String ip = IpAddress().ipAddress;
  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return SliverAppBar(
      expandedHeight: 300.0,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: select.recColor,
          )),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: oneProductElement.images!.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                    child: (oneProductElement.images![itemIndex] != null)
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl: ip +
                                  "/" +
                                  oneProductElement.images![itemIndex].image,
                              placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator(
                                    color: select.mainColo,
                                  )),
                              errorWidget: (context, url, error) =>
                                  Image.asset("asset/Img/banner-img.jpg"),
                              fit: BoxFit.fill,
                            ),
                          )
                        : Image.asset("assets/images/1.jpg"));
              },
              options: CarouselOptions(
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                height: double.infinity,
                onPageChanged: (index, reason) {
                  productIndex.check(index);
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
                children: oneProductElement.images!.map((url) {
                  int index = oneProductElement.images!.indexOf(url);
                  return Container(
                    width: 3.0,
                    height: 3.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: productIndex.sana == index
                          ? select.desColor
                          : select.photodotOffCol,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
