import 'package:flutter/material.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext, index) {
        return ListTile(
          leading: Icon(Icons.search,color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(220, 220, 220, 1) :select.searchResCol),
          title: Text("This is title",
              style: CustomTextStyle.searchres(context)),
        );
      },
      itemCount: 10,
      padding: EdgeInsets.all(5),
    );;
  }
}
