// To parse this JSON data, do
//
//     final bannerProdcut = bannerProdcutFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BannerProdcut bannerProdcutFromJson(String str) => BannerProdcut.fromJson(json.decode(str));

String bannerProdcutToJson(BannerProdcut data) => json.encode(data.toJson());

class BannerProdcut {
  BannerProdcut({
    required this.banners,
  });

  List<Banner> banners;

  factory BannerProdcut.fromJson(Map<String, dynamic> json) => BannerProdcut(
    banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banners": banners == null ? null : List<dynamic>.from(banners.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    required this.id,
    required this.bannerId,
    required this.link,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String bannerId;
  String link;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"] == null ? null : json["id"],
    bannerId: json["banner_id"] == null ? null : json["banner_id"],
    link: json["link"] == null ? null : json["link"],
    image: json["image"] == null ? null : json["image"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "banner_id": bannerId == null ? null : bannerId,
    "link": link == null ? null : link,
    "image": image == null ? null : image,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
