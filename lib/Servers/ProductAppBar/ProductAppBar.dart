import 'package:flutter/material.dart';

import '../../Model/TextColor.dart';
class ProductAppBar extends StatelessWidget {
  const ProductAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: select.recColor,
          )),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          'asset/Img/image 5.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
