
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:serpay/Model/TextColor.dart';

import 'package:serpay/Search/Search/Related/Realted.dart';
import 'package:serpay/Search/Search/SliverGrid/SliverGrid.dart';
import 'package:serpay/Search/Search/Suggestion/Suggestion.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../Model/Colors.dart';
import 'ProductList/ProductList.dart';

class CustomSearchDelegate extends SearchDelegate {
  Colrs select = Colrs();

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1): Color.fromRGBO(250, 250, 250, 1),
      canvasColor: select.tmcolo,
      textTheme: TextTheme(
        // Use this to change the query's text style
        headline6: CustomTextStyle.searchHintStyle(context),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1) : select.searchResCol),
        backgroundColor:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1) :  select.tmcolo,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),focusColor: Colors.white,

        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        filled: true,
        fillColor:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1) :  select.searh,

        // Use this change the placeholder's text style
        hintStyle: CustomTextStyle.searchHintStyle(context),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    );
  }

  bool check = false;

  // Demo list to show quering
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries",
  ];


  // first overrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
              onPressed: () {
                query = '';
              },
              icon: Icon(Icons.close),
            )
    ];
  }

  // second overrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: ThemeServices().theme==ThemeMode.dark?select.searh: select.recColor,
      ),
    );
  }

  // third overrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    check = true;
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    List photoProduct = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
      "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
      "https://wallpapercave.com/wp/wp5187178.jpg"
    ];

    return  ProductGrid()

    ;
  }

  // last overrite to show the
  // quering process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    check = false;
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return query.length == 0
        ? Related(matchQuery: matchQuery)
        : Suggestion();
  }
}
