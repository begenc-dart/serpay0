import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../Model/TextColor.dart';
class FreeProductTop extends StatelessWidget {
  const FreeProductTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10),
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): select.scaf,
                border: Border.all(
                    color: select.photodotOffCol, width: 1),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    (index + 1).toString(),
                    style: CustomTextStyle.topPerson(context),
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(
                      "asset/Img/IMG_20200418_192738.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          "Begenc Jumayew",
                          style: CustomTextStyle.topPersonName(
                              context),
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              "asset/icon/users.svg",color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1):Color.fromRGBO(97, 97, 97, 1) ,),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 5),
                            child: Text(
                              "123",
                              style:
                              CustomTextStyle.topPersonShare(
                                  context),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        // 40 list items
        childCount: 3,
      ),
    );
  }
}
