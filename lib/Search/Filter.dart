import 'package:flutter/material.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController max = TextEditingController();
  late String _max, _min;
  TextEditingController min = TextEditingController();
  late String val = "Default";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back)),
              Text(
                "Filter",
                style: CustomTextStyle.filterTop(context),
              ),
              Text(
                "Clear",
                style: CustomTextStyle.filterClear(context),
              ),
            ],
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price Range",
                          style: CustomTextStyle.priceRange(context),
                        ),
                        Form(
                          key: _formkey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 30,
                                child: TextFormField(

                                  textAlign: TextAlign.left,
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: min,
                                  // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): Colors.white,
                                    hintStyle:CustomTextStyle.fieldmax(context),
                                    errorStyle: CustomTextStyle.error(context),
                                    hintText: "min",
                                  ),
                                  // validator: (jog) {
                                  //   if (jog!.length == 0) {
                                  //     return "full";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  onSaved: (deger) => _min = deger!,
                                ),
                              ),
                              Container(
                                width: 80,
                                height: 30,
                                margin: EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  textAlign: TextAlign.left,
                                  textAlignVertical: TextAlignVertical.bottom,

                                  controller: max,
                                  // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    fillColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): Colors.white,
                                    hintStyle: CustomTextStyle.fieldmax(context),
                                    errorStyle: CustomTextStyle.error(context),
                                    hintText: "max",
                                  ),
                                  // validator: (jog) {
                                  //   if (jog!.length == 0) {
                                  //     return "full";
                                  //   } else {
                                  //     return null;
                                  //   }
                                  // },
                                  onSaved: (deger) => _max = deger!,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ExpansionTile(
                    iconColor: ThemeServices().theme==ThemeMode.dark?Colors.white :Color.fromRGBO(41, 41, 41, 1),

                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sort by",
                          style: CustomTextStyle.priceRange(context),
                        ),
                        Text(
                          val,
                          style: CustomTextStyle.despro(context),
                        )
                      ],
                    ),
                    children: <Widget>[
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.only(left: 30, right: 15),
                        value: "Default",
                        groupValue: val,
                        onChanged: (deger) {
                          setState(() {
                            val = deger.toString();
                          });
                        },
                        title: Text("Default",style: CustomTextStyle.despro(context)),
                      ),
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.only(left: 30, right: 15),
                        value: "Price: Low to High",
                        groupValue: val,
                        onChanged: (deger) {
                          setState(() {
                            val = deger.toString();
                          });
                        },
                        title: Text("Price: Low to High",style: CustomTextStyle.despro(context)),
                      ),
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.only(left: 30, right: 15),
                        value: "Price: High to Low",
                        groupValue: val,
                        onChanged: (deger) {
                          setState(() {
                            val = deger.toString();
                          });
                        },
                        title: Text("Price: High to Low",style: CustomTextStyle.despro(context)),
                      ), //Row
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.only(left: 30, right: 15),
                        value: "New Products",
                        groupValue: val,
                        onChanged: (deger) {
                          setState(() {
                            val = deger.toString();
                          });
                        },
                        title: Text("New Products",style: CustomTextStyle.despro(context)),
                      ),
                      RadioListTile(
                        controlAffinity: ListTileControlAffinity.trailing,
                        contentPadding: EdgeInsets.only(left: 30, right: 15),
                        value: "Top Sales",
                        groupValue: val,
                        onChanged: (deger) {
                          setState(() {
                            val = deger.toString();
                          });
                        },
                        title: Text("Top Sales",style: CustomTextStyle.despro(context)),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: select.mainColo,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: select.shadowCol,
                        blurRadius: 6,
                        spreadRadius: 0,
                      )
                    ]),
                alignment: Alignment.center,
                child: Text(
                  "Show Results",
                  style: CustomTextStyle.showres(context),
                ),
              )
            ]));
  }
}
