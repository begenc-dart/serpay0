import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serpay/MainPage/MainPagee/Aksiya/AksiyaProduct.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/ActionProduct/Action.dart';
import 'package:serpay/MainPage/MainPagee/SkidkaProduct/Discount/DiscountProduct.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../IpAdress.dart';
import '../../../Model/TextColor.dart';
import '../../Model/Action.dart';
import '../SkidkaProduct/NewProduct/NewProduct.dart';

class Aksiya extends StatefulWidget {
  String namepro;

  String img;

  Aksiya({Key? key, required this.img, required this.namepro})
      : super(key: key);

  @override
  State<Aksiya> createState() => _AksiyaState();
}

class _AksiyaState extends State<Aksiya> {
  List photocat = [
    "asset/Img/aksiya 1.jpg",
    "asset/Img/tel.jpg",
    "asset/Img/tel.jpg",
    "asset/Img/tel.jpg",
  ];

  List name = [
    "Aksiya",
    "iPhone 13",
    "iPhone 13",
    "iPhone 13",
  ];
  List? action;
  Future<ActionModel>? take;

  @override
  void initState() {
    // TODO: implement initState
    take = AksiyaProdutModel().fetchAlbum();
    super.initState();
  }

//ThemeServices().theme==ThemeMode.dark?Colors.red:Colors.green,
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: take,
        builder: ((context, AsyncSnapshot<ActionModel> snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
              decoration: BoxDecoration(
                  color: ThemeServices().theme == ThemeMode.dark
                      ? Color.fromRGBO(55, 55, 55, 1)
                      : Color.fromRGBO(255, 20, 29, 0.15),
                  border:
                      Border.all(color: Color.fromRGBO(255, 255, 255, 0.35)),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  snapshot.data!.actionProducts!.length < 3
                      ? snapshot.data!.actionProducts!.length
                      : 4,
                  (int index) {
                    return index != 0
                        ? Container(
                            width: 70,
                            height: 80,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: snapshot.data!.actionProducts![index]
                                              .images!.length ==
                                          0
                                      ? Image.asset(widget.img)
                                      : CachedNetworkImage(
                                    height: 50,
                                          imageUrl:
                                              "${IpAddress().ipAddress}/" +
                                                  snapshot
                                                      .data!
                                                      .actionProducts![index]
                                                      .images![0]
                                                      .image,
                                          placeholder: (context, url) =>
                                              Container(
                                                  alignment: Alignment.center,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.red,
                                                  )),
                                          errorWidget: (context, url, error) =>
                                              Image.asset(
                                                  "asset/Img/banner-img.jpg"),
                                          fit: BoxFit.fill,
                                        ),
                                ),
                                Text(
                                  snapshot.data!.actionProducts![index].nameTm,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: CustomTextStyle.Skidkapro(context),
                                )
                              ],
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              widget.namepro == "Aksiýa"
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ActionProducts(
                                                sort: 0,
                                                page: 0,
                                                checkpage: false,
                                              )))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewProductModel(
                                                sort: 0,
                                                page: 0,
                                                checkpage: false,
                                              )));
                            },
                            child: Container(
                              width: 70,
                              height: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                    color: select.mainColo, width: 0.5),
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(255, 211, 213, 1),
                                      Color.fromRGBO(255, 246, 222, 1)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Image.asset(index == 0
                                        ? widget.img
                                        : photocat[index]),
                                  ),
                                  Text(
                                    widget.namepro == "Aksiýa"
                                        ? widget.namepro
                                        : widget.namepro,
                                    style: CustomTextStyle.newSty(context),
                                  )
                                ],
                              ),
                            ),
                          );
                  },
                ),
              ),
            );
          } else {
            debugPrint(snapshot.toString());
            return CircularProgressIndicator();
          }
        }));
  }
}
