import 'package:flutter/cupertino.dart';

class ProductModel {
  String name, coverImage, description;
  double price;
  double? sale;
  List<String> categories = [];
  List<String>? images = [];

  ProductModel({
    required this.name,
    required this.coverImage,
    required this.description,
    required this.price,
    this.sale,
    required this.categories,
    this.images,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      name: json['name'],
      coverImage: json['image'],
      description: json['description'],
      price: json['price'],
      sale: json['sale'],
      categories: json['categories'],
      images: json['images'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': coverImage,
      'description': description,
      'price': price,
      'sale': sale,
      'categories': categories,
      'images': images,
    };
  }
}
