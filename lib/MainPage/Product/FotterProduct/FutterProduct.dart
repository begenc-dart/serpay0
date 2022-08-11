import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/BrendProduct/BannerProduct.dart';
import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/MainPage/Product/Model/AddCart.dart';
import 'package:serpay/MainPage/Product/ProductChangeNotifier.dart';
import 'package:serpay/Profile/Profile/Contact.dart';
import 'package:serpay/Profile/Profile/Like.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';

class ProductFotter extends StatefulWidget {
  OneProduct oneProductElement;
  Function onpress;

  ProductFotter({required this.oneProductElement, required this.onpress});

  @override
  State<ProductFotter> createState() => _ProductFotterState();
}

class _ProductFotterState extends State<ProductFotter> {
  List photo = [
    "https://i.redd.it/7ppvb8uyrjj61.jpg",
    "https://cdnb.artstation.com/p/assets/video_clips/images/024/538/805/large/pixel-jeff-thumb.jpg?1582740711",
    "https://steamuserimages-a.akamaihd.net/ugc/940586530515504757/CDDE77CB810474E1C07B945E40AE4713141AFD76/?imw=5000&imh=5000&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false"
  ];

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    check = false;
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(246, 246, 246, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BannerProduct(
                                sort: 0,
                                page: 0,
                                checkpage: false,
                                brend: widget.oneProductElement.brand!.brandId,
                                nameBrenad:
                                    widget.oneProductElement.brand!.name,
                              )));
                },
                child: productFotter(
                    "asset/productIcon/home-icon.svg", "Other", context),
              )),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => WishLike()));
            },
            child: productFotter(
                "asset/productIcon/Like.svg", "Favorites", context),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Contact()));
            },
            child: productFotter(
                "asset/productIcon/chat.svg", "Chat Admin", context),
          ),
          GestureDetector(
            onTap: () {
              addcard(context);
            },
            child: Container(
              width: 175,
              decoration: BoxDecoration(color: select.mainColo, boxShadow: [
                BoxShadow(color: select.shadowCol, blurRadius: 6)
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "160 manat",
                    style: CustomTextStyle.productfotterPrice(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Add to basket",
                      style: CustomTextStyle.productfotterBasket(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool check = false;
  int doneme = 0;
  int sizeCounter = 0;
String productSize="";
  addcard(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            check = false;
            return Wrap(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 15, bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            widget.oneProductElement.price.toString(),
                            style: CustomTextStyle.sellproprice(context),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            alignment: Alignment.center,
                            width: 30,
                            height: 15,
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(97, 97, 97, 1)
                                    : select.tmConCol,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "TMT",
                              style: CustomTextStyle.sellpro(context),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Text(
                        widget.oneProductElement.nameTm,
                        style: CustomTextStyle.selldes(context),
                      ),
                    ),
                    widget.oneProductElement.productColors!.length != 0
                        ? Container(
                            height: 90,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                debugPrint(widget
                                    .oneProductElement.productColors![index].id
                                    .toString());
                                return Stack(
                                  children: [
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.5, right: 12.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: index == doneme
                                                  ? Border.all(
                                                      color: select.mainColo,
                                                      width: 2)
                                                  : Border.all(
                                                      color: select.newCol,
                                                      width: 1)),
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 80,
                                                height: 80,
                                                child: widget
                                                            .oneProductElement
                                                            .productColors![
                                                                index]
                                                            .productImages!
                                                            .length !=
                                                        0
                                                    ? CachedNetworkImage(
                                                        imageUrl: widget
                                                            .oneProductElement
                                                            .productColors![
                                                                index]
                                                            .productImages![0]
                                                            .toString(),
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: select
                                                                      .mainColo,
                                                                )),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                "asset/Img/banner-img.jpg"),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        "asset/Img/banner-img.jpg"),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  width: 80,
                                                  alignment: Alignment.center,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: select.photdes),
                                                  child: Text(
                                                    widget
                                                        .oneProductElement
                                                        .productColors![index]
                                                        .colorNameTm
                                                        .toString(),
                                                    style: CustomTextStyle
                                                        .photodesstyle(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                        doneme = index;
                                      },
                                    ),
                                  ],
                                );
                              },
                              itemCount: widget
                                  .oneProductElement.productColors!.length,
                            ))
                        : Container(),
                    widget.oneProductElement.productSizes!.length != 0
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 20, top: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Size:",
                                    style: CustomTextStyle.size(context),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  height: widget.oneProductElement.productSizes!
                                              .length !=
                                          1
                                      ? 90
                                      : 40,
                                  width: MediaQuery.of(context).size.width - 61,
                                  child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: widget.oneProductElement
                                          .productSizes!.length,
                                      gridDelegate: widget.oneProductElement
                                                  .productSizes!.length !=
                                              1
                                          ? SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 15 / 30,
                                              crossAxisSpacing: 15,
                                              crossAxisCount: 2)
                                          : SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 15 / 30,
                                              crossAxisSpacing: 15,
                                              crossAxisCount: 1),
                                      itemBuilder: (context, index) {
                                        productSize=widget.oneProductElement
                                            .productSizes![index].productSizeId;
                                        return InkWell(
                                          onTap: () {
                                            sizeCounter = index;
                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 85,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: index == sizeCounter
                                                    ? Border.all(
                                                        color: ThemeServices().theme == ThemeMode.dark
                                                            ? Color.fromRGBO(
                                                                255, 20, 29, 1)
                                                            : Color.fromRGBO(
                                                                255, 20, 29, 1))
                                                    : Border.all(
                                                        color: ThemeServices().theme == ThemeMode.dark
                                                            ? Color.fromRGBO(
                                                                174, 174, 174, 1)
                                                            : Color.fromRGBO(
                                                                221, 221, 221, 1)),
                                                color: ThemeServices().theme == ThemeMode.dark
                                                    ? Color.fromRGBO(55, 55, 55, 1)
                                                    : select.tmcolo,
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              widget.oneProductElement
                                                  .productSizes![index].size,
                                              style: CustomTextStyle.sizepro(
                                                  context),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 30, bottom: 30),
                          child: Text(
                            "Mukdar:",
                            style: CustomTextStyle.size(context),
                          ),
                        ),
                        Container(
                            width: 100,
                            margin: EdgeInsets.only(top: 15, bottom: 30),
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeServices().theme ==
                                                    ThemeMode.dark
                                                ? Color.fromRGBO(
                                                    174, 174, 174, 1)
                                                : select.login,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Icon(
                                      Icons.remove,
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? Color.fromRGBO(250, 250, 250, 1)
                                          : select.newCol,
                                      size: 10,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _count--;
                                    });
                                  },
                                ),
                                Text(
                                  _count.toString(),
                                  style: TextStyle(
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? Color.fromRGBO(250, 250, 250, 1)
                                          : Color.fromRGBO(39, 39, 39, 1)),
                                ),
                                InkWell(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeServices().theme ==
                                                    ThemeMode.dark
                                                ? Color.fromRGBO(
                                                    174, 174, 174, 1)
                                                : select.login,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Icon(
                                      Icons.add,
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? Color.fromRGBO(250, 250, 250, 1)
                                          : select.newCol,
                                      size: 10,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _count++;
                                    });
                                  },
                                )
                              ],
                            )),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: select.mainColo,
                          boxShadow: [
                            BoxShadow(color: select.shadowCol, blurRadius: 6)
                          ]),
                      child: InkWell(
                        onTap: (){
                          AddCart().createUser(widget.oneProductElement.productId, productSize, _count.toString(), true.toString());
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "8238",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: select.tmcolo),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "manat",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: select.tmcolo),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                "Add to basket",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: select.tmcolo),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

  setSt() {
    setState(() {
      widget.onpress();
    });
  }

  productFotter(String imgurl, String con, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          imgurl,
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(174, 174, 174, 1)
              : Color.fromRGBO(133, 133, 133, 1),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            con,
            style: CustomTextStyle.proother(context),
          ),
        )
      ],
    );
  }
}
