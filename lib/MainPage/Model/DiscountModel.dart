// To parse this JSON data, do
//
//     final discountModdel = discountModdelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DiscountModdel discountModdelFromJson(String str) => DiscountModdel.fromJson(json.decode(str));

String discountModdelToJson(DiscountModdel data) => json.encode(data.toJson());

class DiscountModdel {
  DiscountModdel({
    required this.discountProducts,
  });

  List<DiscountProduct> discountProducts;

  factory DiscountModdel.fromJson(Map<String, dynamic> json) => DiscountModdel(
    discountProducts: List<DiscountProduct>.from(json["discount_products"].map((x) => DiscountProduct.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "discount_products": discountProducts == null ? null : List<dynamic>.from(discountProducts.map((x) => x.toJson())),
  };
}

class DiscountProduct {
  DiscountProduct({
    required this.id,
    required this.productId,
    required this.nameTm,
    required this.nameRu,
    required this.bodyTm,
    required this.bodyRu,
    required this.productCode,
    required this.price,
    required this.priceOld,
    required this.priceTm,
    required this.priceTmOld,
    required this.priceUsd,
    required this.priceUsdOld,
    required this.discount,
    required this.isActive,
    required this.sex,
    required this.isNew,
    required this.isAction,
    required this.rating,
    required this.ratingCount,
    required this.soldCount,
    required this.likeCount,
    required this.isNewExpire,
    required this.isLiked,
    required this.categoryId,
    required this.subcategoryId,
    required this.brandId,
    required this.createdAt,
    required this.updatedAt,
    required this.images,
  });

  int id;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String productCode;
  int price;
  int priceOld;
  int priceTm;
  int priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int discount;
  bool isActive;
  String sex;
  bool isNew;
  bool isAction;
  int rating;
  int ratingCount;
  int soldCount;
  int likeCount;
  String isNewExpire;
  bool isLiked;
  int categoryId;
  int subcategoryId;
  int brandId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images> images;

  factory DiscountProduct.fromJson(Map<String, dynamic> json) => DiscountProduct(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    productCode: json["product_code"] == null ? null : json["product_code"],
    price: json["price"] == null ? null : json["price"],
    priceOld: json["price_old"] == null ? null : json["price_old"],
    priceTm: json["price_tm"] == null ? null : json["price_tm"],
    priceTmOld: json["price_tm_old"] == null ? null : json["price_tm_old"],
    priceUsd: json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"] == null ? null : json["discount"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    sex: json["sex"] == null ? null : json["sex"],
    isNew: json["isNew"] == null ? null : json["isNew"],
    isAction: json["isAction"] == null ? null : json["isAction"],
    rating: json["rating"] == null ? null : json["rating"],
    ratingCount: json["rating_count"] == null ? null : json["rating_count"],
    soldCount: json["sold_count"] == null ? null : json["sold_count"],
    likeCount: json["likeCount"] == null ? null : json["likeCount"],
    isNewExpire: json["is_new_expire"] == null ? null : json["is_new_expire"],
    isLiked: json["isLiked"] == null ? null : json["isLiked"],
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    subcategoryId: json["subcategoryId"] == null ? null : json["subcategoryId"],
    brandId: json["brandId"] == null ? null : json["brandId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "product_code": productCode == null ? null : productCode,
    "price": price == null ? null : price,
    "price_old": priceOld == null ? null : priceOld,
    "price_tm": priceTm == null ? null : priceTm,
    "price_tm_old": priceTmOld == null ? null : priceTmOld,
    "price_usd": priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount == null ? null : discount,
    "isActive": isActive == null ? null : isActive,
    "sex": sex == null ? null : sex,
    "isNew": isNew == null ? null : isNew,
    "isAction": isAction == null ? null : isAction,
    "rating": rating == null ? null : rating,
    "rating_count": ratingCount == null ? null : ratingCount,
    "sold_count": soldCount == null ? null : soldCount,
    "likeCount": likeCount == null ? null : likeCount,
    "is_new_expire": isNewExpire == null ? null : isNewExpire,
    "isLiked": isLiked == null ? null : isLiked,
    "categoryId": categoryId == null ? null : categoryId,
    "subcategoryId": subcategoryId == null ? null : subcategoryId,
    "brandId": brandId == null ? null : brandId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class Images {
  Images({
    required this.id,
    required this.productId,
    required this.image,
    required this.productcolorId,
    required this.createdAt,
    required this.updatedAt,
    required this.freeproductId,
  });

  int id;
  int productId;
  String image;
  int? productcolorId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic freeproductId;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"] == null ? null : json["id"],
    productId: json["productId"] == null ? null : json["productId"],
    image: json["image"] == null ? null : json["image"],
    productcolorId: json["productcolorId"] == null ? null : json["productcolorId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    freeproductId: json["freeproductId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "productId": productId == null ? null : productId,
    "image": image == null ? null : image,
    "productcolorId": productcolorId == null ? null : productcolorId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "freeproductId": freeproductId,
  };
}
