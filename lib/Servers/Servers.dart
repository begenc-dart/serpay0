import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Model/TextColor.dart';


import '../Model/Colors.dart';
import 'AllFreeProduct/AllFreeProduct.dart';
import 'FreeProduct.dart';

class Servers extends StatefulWidget {
  const Servers({Key? key}) : super(key: key);

  @override
  _ServersState createState() => _ServersState();
}

class _ServersState extends State<Servers> {
  Colrs select = Colrs();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SvgPicture.asset("asset/icon/FreeProd.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 5),
                  child: Text(
                    "Services",
                    style: CustomTextStyle.server(context),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AllFreeProd()));
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: select.serverShadowColor,
                          offset: const Offset(
                           0,
                            50.0,
                          ),
                          blurRadius: 30.0,
                          spreadRadius: -20.0,
                        ),
                      ],
                        image: DecorationImage(
                            image: AssetImage(
                              "asset/Img/Frame 237.jpg",
                            ),
                            fit: BoxFit.fill)),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
