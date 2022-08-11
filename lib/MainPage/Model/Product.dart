// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.product,
  });

  ProductModelProduct product;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    product:ProductModelProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product == null ? null : product.toJson(),
  };
}

class ProductModelProduct {
  ProductModelProduct({
    required this.oneProduct,
    required this.recommenendations,
  });

  OneProduct oneProduct;
  Recommenendations recommenendations;

  factory ProductModelProduct.fromJson(Map<String, dynamic> json) => ProductModelProduct(
    oneProduct:  OneProduct.fromJson(json["oneProduct"]),
    recommenendations:  Recommenendations.fromJson(json["recommenendations"]),
  );

  Map<String, dynamic> toJson() => {
    "oneProduct": oneProduct == null ? null : oneProduct.toJson(),
    "recommenendations": recommenendations == null ? null : recommenendations.toJson(),
  };
}

class OneProduct {
  OneProduct({
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
    required this.productColors,
    required this.productSizes,
    required this.images,
    required this.details,
    required this.brand,
    required this.productStock,
  });

  int id;
  String productId;
  String nameTm;
  String nameRu;
  String bodyTm;
  String bodyRu;
  String? productCode;
  int? price;
  int? priceOld;
  int? priceTm;
  int? priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int? discount;
  bool isActive;
  String sex;
  bool isNew;
  bool? isAction;
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
  List<ProductColor>? productColors;
  List<ProductSize>? productSizes;
  List<Images>? images;
  List<Detail>? details;
  Brand? brand;
  List<ProductSStock>? productStock;

  factory OneProduct.fromJson(Map<String, dynamic> json) => OneProduct(
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
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    productColors: json["product_colors"] == null ? null : List<ProductColor>.from(json["product_colors"].map((x) => ProductColor.fromJson(x))),
    productSizes: json["product_sizes"] == null ? null : List<ProductSize>.from(json["product_sizes"].map((x) => ProductSize.fromJson(x))),
    images: json["images"] == null ? null : List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
    details: json["details"] == null ? null : List<Detail>.from(json["details"].map((x) => Detail.fromJson(x))),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    productStock: json["product_stock"] == null ? null : List<ProductSStock>.from(json["product_stock"].map((x) => ProductSStock.fromJson(x))),
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
    "product_colors": productColors == null ? null : List<dynamic>.from(productColors!.map((x) => x.toJson())),
    "product_sizes": productSizes == null ? null : List<dynamic>.from(productSizes!.map((x) => x.toJson())),
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
    "details": details == null ? null : List<dynamic>.from(details!.map((x) => x.toJson())),
    "brand": brand == null ? null : brand!.toJson(),
    "product_stock": productStock == null ? null : List<dynamic>.from(productStock!.map((x) => x.toJson())),
  };
}

class Brand {
  Brand({
    required this.id,
    required this.brandId,
    required this.name,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String brandId;
  String name;
  dynamic image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"] == null ? null : json["id"],
    brandId: json["brand_id"] == null ? null : json["brand_id"],
    name: json["name"] == null ? null : json["name"],
    image: json["image"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "brand_id": brandId == null ? null : brandId,
    "name": name == null ? null : name,
    "image": image,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class Detail {
  Detail({
    required this.id,
    required this.detailId,
    required this.image,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String detailId;
  String image;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    id: json["id"] == null ? null : json["id"],
    detailId: json["detail_id"] == null ? null : json["detail_id"],
    image: json["image"] == null ? null : json["image"],
    productId: json["productId"] == null ? null : json["productId"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "detail_id": detailId == null ? null : detailId,
    "image": image == null ? null : image,
    "productId": productId == null ? null : productId,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
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
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
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

class ProductColor {
  ProductColor({
    required this.id,
    required this.productColorId,
    required this.productId,
    required this.colorNameTm,
    required this.colorNameRu,
    required this.createdAt,
    required this.updatedAt,
    required this.productImages,
    required this.productSizes,
  });

  int id;
  String productColorId;
  int productId;
  String colorNameTm;
  String colorNameRu;
  DateTime createdAt;
  DateTime updatedAt;
  List<Images>? productImages;
  List<ProductSize>? productSizes;

  factory ProductColor.fromJson(Map<String, dynamic> json) => ProductColor(
    id: json["id"] == null ? null : json["id"],
    productColorId: json["product_color_id"] == null ? null : json["product_color_id"],
    productId: json["productId"] == null ? null : json["productId"],
    colorNameTm: json["color_name_tm"] == null ? null : json["color_name_tm"],
    colorNameRu: json["color_name_ru"] == null ? null : json["color_name_ru"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    productImages: json["product_images"] == null ? null : List<Images>.from(json["product_images"].map((x) => Images.fromJson(x))),
    productSizes: json["product_sizes"] == null ? null : List<ProductSize>.from(json["product_sizes"].map((x) => ProductSize.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_color_id": productColorId == null ? null : productColorId,
    "productId": productId == null ? null : productId,
    "color_name_tm": colorNameTm == null ? null : colorNameTm,
    "color_name_ru": colorNameRu == null ? null : colorNameRu,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "product_images": productImages == null ? null : List<dynamic>.from(productImages!.map((x) => x.toJson())),
    "product_sizes": productSizes == null ? null : List<dynamic>.from(productSizes!.map((x) => x.toJson())),
  };
}

class ProductSize {
  ProductSize({
    required this.id,
    required this.productSizeId,
    required this.productId,
    required this.productColorId,
    required this.size,
    required this.price,
    required this.priceOld,
    required this.priceTm,
    required this.priceTmOld,
    required this.priceUsd,
    required this.priceUsdOld,
    required this.discount,
    required this.createdAt,
    required this.updatedAt,
    required this.productSizeStock,
  });

  int id;
  String productSizeId;
  int productId;
  int? productColorId;
  String size;
  double price;
  dynamic priceOld;
  dynamic priceTm;
  dynamic priceTmOld;
  int? priceUsd;
  dynamic priceUsdOld;
  dynamic discount;
  DateTime createdAt;
  DateTime updatedAt;
  ProductSStock? productSizeStock;

  factory ProductSize.fromJson(Map<String, dynamic> json) => ProductSize(
    id: json["id"] == null ? null : json["id"],
    productSizeId: json["product_size_id"] == null ? null : json["product_size_id"],
    productId: json["productId"] == null ? null : json["productId"],
    productColorId: json["productColorId"] == null ? null : json["productColorId"],
    size: json["size"] == null ? null : json["size"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    priceOld: json["price_old"],
    priceTm: json["price_tm"],
    priceTmOld: json["price_tm_old"],
    priceUsd: json["price_usd"] == null ? null : json["price_usd"],
    priceUsdOld: json["price_usd_old"],
    discount: json["discount"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    productSizeStock: json["product_size_stock"] == null ? null : ProductSStock.fromJson(json["product_size_stock"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_size_id": productSizeId == null ? null : productSizeId,
    "productId": productId == null ? null : productId,
    "productColorId": productColorId == null ? null : productColorId,
    "size": size == null ? null : size,
    "price": price == null ? null : price,
    "price_old": priceOld,
    "price_tm": priceTm,
    "price_tm_old": priceTmOld,
    "price_usd": priceUsd == null ? null : priceUsd,
    "price_usd_old": priceUsdOld,
    "discount": discount,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "product_size_stock": productSizeStock == null ? null : productSizeStock!.toJson(),
  };
}

class ProductSStock {
  ProductSStock({
    required this.id,
    required this.productId,
    required this.productsizeId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  int productId;
  int? productsizeId;
  int quantity;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductSStock.fromJson(Map<String, dynamic> json) => ProductSStock(
    id: json["id"] == null ? null : json["id"],
    productId: json["productId"] == null ? null : json["productId"],
    productsizeId: json["productsizeId"] == null ? null : json["productsizeId"],
    quantity: json["quantity"] == null ? null : json["quantity"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "productId": productId == null ? null : productId,
    "productsizeId": productsizeId == null ? null : productsizeId,
    "quantity": quantity == null ? null : quantity,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}

class Recommenendations {
  Recommenendations({
    required this.id,
    required this.categoryId,
    required this.nameTm,
    required this.nameRu,
    required this.createdAt,
    required this.updatedAt,
    required this.products,
  });

  int id;
  String categoryId;
  String nameTm;
  String nameRu;
  DateTime createdAt;
  DateTime updatedAt;
  List<ProductElement>? products;

  factory Recommenendations.fromJson(Map<String, dynamic> json) => Recommenendations(
    id: json["id"] == null ? null : json["id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    products: json["products"] == null ? null : List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "category_id": categoryId == null ? null : categoryId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "products": products == null ? null : List<dynamic>.from(products!.map((x) => x.toJson())),
  };
}

class ProductElement {
  ProductElement({
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
  dynamic productCode;
  int? price;
  dynamic priceOld;
  int? priceTm;
  dynamic priceTmOld;
  dynamic priceUsd;
  dynamic priceUsdOld;
  int? discount;
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
  List<Images>? images;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
    id: json["id"] == null ? null : json["id"],
    productId: json["product_id"] == null ? null : json["product_id"],
    nameTm: json["name_tm"] == null ? null : json["name_tm"],
    nameRu: json["name_ru"] == null ? null : json["name_ru"],
    bodyTm: json["body_tm"] == null ? null : json["body_tm"],
    bodyRu: json["body_ru"] == null ? null : json["body_ru"],
    productCode: json["product_code"],
    price: json["price"] == null ? null : json["price"],
    priceOld: json["price_old"],
    priceTm: json["price_tm"] == null ? null : json["price_tm"],
    priceTmOld: json["price_tm_old"],
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
    createdAt:  DateTime.parse(json["createdAt"]),
    updatedAt:  DateTime.parse(json["updatedAt"]),
    images: json["images"] == null ? null :  List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "product_id": productId == null ? null : productId,
    "name_tm": nameTm == null ? null : nameTm,
    "name_ru": nameRu == null ? null : nameRu,
    "body_tm": bodyTm == null ? null : bodyTm,
    "body_ru": bodyRu == null ? null : bodyRu,
    "product_code": productCode,
    "price": price == null ? null : price,
    "price_old": priceOld,
    "price_tm": priceTm == null ? null : priceTm,
    "price_tm_old": priceTmOld,
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
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}
