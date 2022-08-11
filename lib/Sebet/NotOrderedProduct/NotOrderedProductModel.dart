// To parse this JSON data, do
//
//     final notOrderedProduct = notOrderedProductFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NotOrderedProduct notOrderedProductFromJson(String str) => NotOrderedProduct.fromJson(json.decode(str));

String notOrderedProductToJson(NotOrderedProduct data) => json.encode(data.toJson());

class NotOrderedProduct {
  NotOrderedProduct({
    required this.notOrderedProducts,
  });

  List<NotOrderedProductElement>? notOrderedProducts;

  factory NotOrderedProduct.fromJson(Map<String, dynamic> json) => NotOrderedProduct(
    notOrderedProducts: json["not_ordered_products"] == null ? null : List<NotOrderedProductElement>.from(json["not_ordered_products"].map((x) => NotOrderedProductElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "not_ordered_products": notOrderedProducts == null ? null : List<dynamic>.from(notOrderedProducts!.map((x) => x.toJson())),
  };
}

class NotOrderedProductElement {
  NotOrderedProductElement({
    required this.orderproductId,
    required this.productId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.image,
    required this.quantity,
    required this.isSelected,
    required this.size,
    required this.price,
    required this.priceOld,
    required this.totalPrice,
    required this.productSizeId,
  });

  String orderproductId;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String image;
  int quantity;
  bool isSelected;
  String size;
  double price;
  dynamic priceOld;
  double totalPrice;
  String productSizeId;

  factory NotOrderedProductElement.fromJson(Map<String, dynamic> json) => NotOrderedProductElement(
    orderproductId: json["orderproduct_id"] == null ? null : json["orderproduct_id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    image: json["image"] == null ? null : json["image"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    isSelected: json["isSelected"] == null ? null : json["isSelected"],
    size: json["size"] == null ? null : json["size"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld: json["price_old"],
    totalPrice:  json["total_price"].toDouble(),
    productSizeId: json["product_size_id"] == null ? null : json["product_size_id"],
  );

  Map<String, dynamic> toJson() => {
    "orderproduct_id": orderproductId == null ? null : orderproductId,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "image": image == null ? null : image,
    "quantity": quantity == null ? null : quantity,
    "isSelected": isSelected == null ? null : isSelected,
    "size": size == null ? null : size,
    "price": price == null ? null : price,
    "price_old": priceOld,
    "total_price": totalPrice == null ? null : totalPrice,
    "product_size_id": productSizeId == null ? null : productSizeId,
  };
}
