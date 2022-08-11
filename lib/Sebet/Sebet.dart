import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Sebet/NotOrderedProduct/IsSelect.dart';
import 'package:serpay/Sebet/NotOrderedProduct/UpdateProduct.dart';
import 'package:serpay/Sebet/Order.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../IpAdress.dart';
import '../LogIn/LogIn/Model/token.dart';
import '../Model/Colors.dart';
import 'package:http/http.dart' as http;

import 'NotOrderedProduct/NotOrderedProductModel.dart';
class Sebet extends StatefulWidget {
  const Sebet({Key? key}) : super(key: key);

  @override
  _SebetState createState() => _SebetState();
}

class _SebetState extends State<Sebet> {
  final Map<String, bool> _map = {};
  int _count = 0;
  Colrs select = Colrs();
bool check=false;
  int current_page = 0;
  String? token;
  late NotOrderedProduct notOrderedProduct;
  List<NotOrderedProductElement> prod = [];
  Future<bool> fetchAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });

    if (isrefest) {
      current_page = 0;
    }

    final response = await http.get(
        Uri.parse(
            "${IpAddress().ipAddress}/users/not-ordered?offset=$current_page"),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer ${token}',
        }

    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {

      notOrderedProduct = notOrderedProductFromJson(response.body);

      debugPrint(response.statusCode.toString());
      if (isrefest) {
        prod = notOrderedProduct.notOrderedProducts!;
      } else {
        prod.addAll(notOrderedProduct.notOrderedProducts!);
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sebet",
              style: CustomTextStyle.carAppBar(context),
            ),
            Text(
              "Clear",
              style: CustomTextStyle.carAppBarClear(context),
            )
          ],
        ),
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        elevation: 0,
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
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 202,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(itemBuilder: (context, index) {
                return OrderProduct(check: prod[index].isSelected, count: prod[index].quantity, prod: prod[index],);
              },itemCount: prod.length,),
              ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(39, 39, 39, 1)
                          : select.tmcolo,
                      border: Border.all(color:  ThemeServices().theme == ThemeMode.dark
                          ?Color.fromRGBO(97, 97, 97, 1):select.bannerOffColor, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "1280",
                        style: CustomTextStyle.pricecard(context),
                      ),
                      Text(
                        "TMT",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ThemeServices().theme == ThemeMode.dark
                                ? Colors.white
                                : select.tabColo),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Order()));
                  },
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(color: select.mainColo, boxShadow: [
                      BoxShadow(color: select.shadowCol, blurRadius: 6)
                    ]),
                    child: Center(
                        child: Text(
                          "Order",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: select.tmcolo),
                          textAlign: TextAlign.end,
                        )),
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
class OrderProduct extends StatefulWidget {
bool check;
int count;
NotOrderedProductElement prod;
OrderProduct({required this.check,required this.count,required this.prod});

  @override
  _OrderProductState createState() => _OrderProductState();
}

class _OrderProductState extends State<OrderProduct> {
  @override
  Widget build(BuildContext context) {
    return  CheckboxListTile(
      value: widget.check,
      controlAffinity: ListTileControlAffinity.leading,

      onChanged: (value) {

        setState(() =>widget.check = value!);
        IsSelected().createUser(widget.prod.orderproductId, widget.check.toString());
      },
      subtitle: Row(
        children: [
          Expanded(child: CachedNetworkImage(imageUrl: "${IpAddress().ipAddress}/${widget.prod.image}",)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.prod.nameTm,
                  style: CustomTextStyle.cardDes(context),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 8, bottom: 15),
                  child: Text(
                  "Size "+  widget.prod.size,
                    style: CustomTextStyle.cardName(context),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width:
                  MediaQuery.of(context).size.width / 2 - 20,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.prod.price.toString()+"TMT",
                        style: CustomTextStyle.cardPrice(context),
                      ),
                      Container(
                        height: 20,
                        child: widget.count != 0
                            ? Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                setState(() {
                                  widget.count--;
                                });
                                UpdateProduct().createUser(widget.prod.orderproductId, widget.count);
                              },
                              child:  Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: ThemeServices()
                                            .theme ==
                                            ThemeMode.dark
                                            ? Color.fromRGBO(
                                            174, 174, 174, 1)
                                            : Color.fromRGBO(
                                            41, 41, 41, 1),
                                        width: 0.8
                                    )),
                                margin: EdgeInsets.only(
                                    right: 10),
                                child:  Icon(
                                  Icons.remove,
                                  color: ThemeServices()
                                      .theme ==
                                      ThemeMode.dark
                                      ? Color.fromRGBO(
                                      250, 250, 250, 1)
                                      : Colors.black,
                                  size: 12,
                                ),
                              ),
                            ),
                            new Text(widget.count.toString(),style: CustomTextStyle.freeProdcuttime(context),),
                            10 > widget.count
                                ? InkWell(
                              onTap: () async {
                                setState(() {
                                  widget.count++;
                                });
                                UpdateProduct().createUser(widget.prod.orderproductId, widget.count);
                              },
                              child: new Container(
                                width: 20,
                                height: 20,
                                decoration:
                                BoxDecoration(
                                    borderRadius: BorderRadius.circular(2),
                                    border: Border.all(
                                        color: ThemeServices()
                                            .theme ==
                                            ThemeMode.dark
                                            ? Color.fromRGBO(
                                            174, 174, 174, 1)
                                            : Color.fromRGBO(
                                            41, 41, 41, 1),
                                        width: 0.8
                                    )),
                                margin:
                                EdgeInsets.only(
                                    left: 10),
                                child: new Icon(
                                  Icons.add,
                                  color: ThemeServices()
                                      .theme ==
                                      ThemeMode.dark
                                      ? Color.fromRGBO(
                                      250, 250, 250, 1)
                                      : Colors.black,
                                  size: 12,
                                ),
                              ),
                            )
                                : Container(
                              padding:
                              EdgeInsets.only(
                                  left: 17),
                              child: new Icon(
                                Icons.add,
                                color: Colors.black54,
                                size: 14,
                              ),
                            ),
                          ],
                        )
                            : InkWell(
                            onTap: () async {
                              setState(() {
                                widget.count = 1;
                              });
                            },
                            child: Container(
                              width: 25,
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromRGBO(
                                        41, 41, 41, 1),
                                    width: 0.8,
                                  ),
                                  borderRadius:
                                  BorderRadius.circular(
                                      2)),
                              child: Text(
                                "x1",
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      Icon(Icons.delete,color:Color.fromRGBO(255, 20, 29, 1) ,)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );;
  }
}
