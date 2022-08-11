import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

class OrderProdut extends StatefulWidget {
  const OrderProdut({Key? key}) : super(key: key);

  @override
  _OrderProdutState createState() => _OrderProdutState();
}

class _OrderProdutState extends State<OrderProdut> {


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

                Form(
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Adyňyz:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: name,
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                          style: TextStyle(
                              fontSize: 18,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white
                                  : Color.fromRGBO(55, 55, 55, 1)),
                          decoration: InputDecoration(
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(55, 55, 55, 1)
                                : Colors.white,

                            // hintStyle:CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _name = deger!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Telefon belgiňiz:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 18,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white
                                  : Color.fromRGBO(55, 55, 55, 1)),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,

                          controller: phone,
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(55, 55, 55, 1)
                                : Colors.white,

                            // hintStyle: CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "max",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _phone = deger!,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    "Töleg görnüşi:",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    type("asset/productIcon/Group 291 (1).svg",
                        "Nagt däl görnüşde"),
                    type("asset/productIcon/Group 292.svg", "Nagt görnüşde"),
                    type("asset/productIcon/Group 291.svg", "Online töleg")
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 15, right: 15),
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
      ),
    );
  }

  type(String icon, String text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                spreadRadius: -5,
                offset: Offset.fromDirection(0, 16),
                color: Color.fromRGBO(0, 0, 0, 0.05)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              text,
              style: CustomTextStyle.CardType(context),
            ),
          ),
        ],
      ),
    );
  }
}
