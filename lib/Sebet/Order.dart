import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../MainPage/PhotoIndex.dart';
import 'Order/OrderProduct.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  List photoProduct = [
    "asset/Img/banner-img.jpg",
    "asset/Img/banner-img.jpg",
    "asset/Img/banner-img.jpg"
  ];
  final _formkey = GlobalKey<FormState>();
  String address =
      "Ashgabad, Magtumguly avenue 1, 41/1 Business Center, No 106";
  Colrs select = Colrs();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  late String _name, _phone;
  String? paymentType;

  @override
  Widget build(BuildContext context) {
    final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          "Order",
          style: CustomTextStyle.carAppBar(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 136,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15,top: 15,bottom: 14),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => OrderProdut()));
                          },
                          child: Text("Info:",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(174, 174, 174, 1)),)),
                      Padding(
                        padding: const EdgeInsets.only(left: 12,right: 12),
                        child: Text("Adam Johnson",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color:ThemeServices().theme == ThemeMode.dark
                            ? Color.fromRGBO(250, 250, 250, 1):Color.fromRGBO(97, 97, 97, 1)),),
                      ),
                      Text("+99361626364",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Color.fromRGBO(174, 174, 174, 1)),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    "Address:",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : select.dorpDown,
                    // borderRadius: BorderRadius.circular(5)
                  ),
                  margin: const EdgeInsets.all(15),
                  padding: EdgeInsets.all(5),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      alignment: Alignment.centerLeft,
                      focusColor: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(55, 55, 55, 1)
                          : Colors.white,
                      value: address,
                      //elevation: 5,
                      isExpanded: true,

                      dropdownColor: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(55, 55, 55, 1)
                          : Colors.white,
                      style: TextStyle(color: select.dorpDown),
                      iconEnabledColor: Color.fromRGBO(97, 97, 97, 1),
                      items: <String>[
                        'Ashgabad, Magtumguly avenue 1, 41/1 Business Center, No 106',
                        'Ashgabad, Parahat 7 No 106',
                        'Ashgabad, Parahat 7 dom2',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                            child: Text(
                              value,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ThemeServices().theme == ThemeMode.dark
                                      ? Color.fromRGBO(250, 250, 250, 1)
                                      : select.recColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "10+",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? tip) {
                        setState(() {
                          address = tip.toString();
                        });
                      },
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(48, 48, 48, 1):Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child:  Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Column(
                        children: List.generate(3, (index) =>  Container(
                          margin: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromRGBO(229, 229, 229, 1),
                                width: 1),
                            borderRadius: BorderRadius.circular(5),
                            color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Color.fromRGBO(243, 243, 243, 1),),
                          child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Stack(
                                      children: [
                                        CarouselSlider.builder(
                                          itemCount: photoProduct.length,
                                          itemBuilder: (BuildContext context,
                                              int itemIndex,
                                              int pageViewIndex){

                                            return Container(
                                                width: 120,
                                                child: (photoProduct[
                                                itemIndex] !=
                                                    null)
                                                    ? ClipRRect(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(5),
                                                  child: CachedNetworkImage(
                                                    imageUrl: photoProduct[itemIndex],

                                                    placeholder: (context, url) =>
                                                        Container(
                                                            alignment:
                                                            Alignment.center,
                                                            child:
                                                            CircularProgressIndicator(
                                                              color: Colors.red,
                                                            )),
                                                    errorWidget: (context, url,
                                                        error) =>
                                                        Image.asset(
                                                            "asset/Img/banner-img.jpg"),
                                                    fit: BoxFit.fill ,
                                                  ),
                                                )
                                                    : Image.asset(
                                                    "assets/images/1.jpg"));},
                                          options: CarouselOptions(
                                            viewportFraction: 1,
                                            aspectRatio: 16 / 9,
                                            height: 100,
                                            onPageChanged: (index, reason) {
                                              productIndex.check(index);
                                            },
                                            initialPage: 0,
                                            enableInfiniteScroll: true,
                                            reverse: false,
                                            autoPlay: false,
                                            autoPlayInterval:
                                            Duration(seconds: 10),
                                            autoPlayAnimationDuration:
                                            Duration(milliseconds: 800),
                                            autoPlayCurve: Curves.fastOutSlowIn,
                                            enlargeCenterPage: true,
                                            scrollDirection: Axis.horizontal,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          width:
                                          MediaQuery.of(context).size.width /
                                              2 -
                                              60,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: photoProduct.map((url) {
                                              int index =
                                              photoProduct.indexOf(url);
                                              return Container(
                                                width: 3.0,
                                                height: 3.0,
                                                margin: EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 3.0),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: productIndex.sana == index
                                                      ? Color.fromRGBO(
                                                      85, 85, 85, 1)
                                                      : Color.fromRGBO(
                                                      221, 221, 221, 1),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 10, top: 10),
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              "Beko Washing Machine",maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(250, 250, 250, 1): Color.fromRGBO(84, 84, 84, 1)),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 5),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "1831",
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color.fromRGBO(255, 20, 29, 1),
                                                      ),
                                                    ),
                                                    SizedBox(width: 4,),
                                                    Text(
                                                      "TMT",
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight: FontWeight.w700,
                                                        color: Color.fromRGBO(255, 20, 29, 1),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 26,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(2),
                                                  border: Border.all(
                                                      color: Color.fromRGBO(174, 174, 174, 1),
                                                      width: 0.8),
                                                ),
                                                child: Text(
                                                  "x4",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14,
                                                      color: Color.fromRGBO(174, 174, 174, 1)),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),)


                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text("Toleg gornusi:",
                          style: CustomTextStyle.drowDown(context)),
                      ),
                      Text("Kart arkaly",
                        style: CustomTextStyle.CardType(context),)
                    ],
                  ),
                )

              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 50,
                //alignment: Alignment.center,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "1280",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    Text(
                      "TMT",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                  ],
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width/2-20,
                height: 50,
                alignment: Alignment.center,

                decoration: BoxDecoration(
                    color: select.mainColo,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "Order",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: select.tmcolo),
                ),
              ),
            ],
          )

          ///list


        ],
      ),
    );
  }

}
