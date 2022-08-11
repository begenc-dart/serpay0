import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Model/TextColor.dart';
class ProductDesc extends StatelessWidget {
  const ProductDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              "Zara Loafer women",
              style:
              CustomTextStyle.carAppBar(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text(
              "The battery capacity of iPhone 13 mini, 13, 13 Pro and 13 Pro Max is 2406 mAh, 3227 mAh, 3095 mAh and 4352 mAh respectively, which is up 8%.",
              style:
              CustomTextStyle.chatwhite(context),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: new LinearPercentIndicator(
              width: 185,
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2000,
              percent:0.6,
              center: Text(
                "60.0%",
                style: CustomTextStyle.productproset(context),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              // progressColor: Colors.greenAccent,
              linearGradient: LinearGradient(colors: [
                select.freeProd,
                select.mainColo,
              ]),
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(left: 15,top: 5, bottom: 10),
            child: Row(
              children: [
                SvgPicture.asset("asset/icon/award.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Top-5",
                    style: CustomTextStyle.top(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
