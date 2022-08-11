import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';
class Related extends StatelessWidget {
  List matchQuery;
  Related({required this.matchQuery});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 20),
          child: Text("History", style: CustomTextStyle.history(context)),
        ),
        Container(
          height: matchQuery.length * 18,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180, childAspectRatio: 3),
            itemBuilder: (BuildContext context, index) {
              var result = matchQuery[index];
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 18),
                decoration: BoxDecoration(
                    color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1) :  select.searh,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("asset/icon/history-icon.svg"),
                    Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(matchQuery[index],
                            style: CustomTextStyle.searchHintStyletext(
                                context))),
                  ],
                ),
              );
            },
            itemCount: matchQuery.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 20),
          child: Text("Recommendation",
              style: CustomTextStyle.history(context)),
        ),
        Container(
          height: matchQuery.length * 18,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150, childAspectRatio: 3),
            itemBuilder: (BuildContext context, index) {
              var result = matchQuery[index];
              return Container(
                margin: EdgeInsets.only(left: 15, right: 15, bottom: 18),
                decoration: BoxDecoration(
                    color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1): select.searh,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        matchQuery[index],
                        style:
                        CustomTextStyle.searchHintStyletext(context),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: matchQuery.length,
          ),
        ),
      ],
    );
  }
}
