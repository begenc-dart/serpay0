import 'package:flutter/material.dart';
import 'package:serpay/MainPage/Model/Product.dart';

import '../../../Model/TextColor.dart';

class ProductText extends StatelessWidget {
  OneProduct oneProductElement;
  ProductText({required this.oneProductElement});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  oneProductElement.price.toString(),
                  style: CustomTextStyle.price(context),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 25),
                  width: 30,
                  height: 15,
                  decoration: BoxDecoration(
                      color: select.disCol,
                      borderRadius: BorderRadius.circular(2)),
                  child: Center(
                      child: Text(
                    "TMT",
                    style: CustomTextStyle.tmtpro(context),
                  )),
                ),
                oneProductElement.priceOld != null ?
                Text(
                  "${oneProductElement.priceOld} TMT",
                  style: CustomTextStyle.dispro(context),
                ) : Container(),
                oneProductElement.discount != 0 ?
                Container(
                  margin: EdgeInsets.only(left: 25),
                  width: 31,
                  height: 15,
                  decoration: BoxDecoration(
                    color: select.mainColo,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                      child: Text(
                    "-${oneProductElement.discount}%",
                    style: CustomTextStyle.disprod(context),
                  )),
                ) : Container()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              oneProductElement.nameTm,
              style: CustomTextStyle.despro(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              oneProductElement.bodyTm,
              style: CustomTextStyle.productdes(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Details",
              style: CustomTextStyle.detpro(context),
            ),
          ),
        ],
      ),
    );
  }

  realated(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Related", style: CustomTextStyle.detpro(context)),
          )
        ],
      ),
    );
  }
}
