import 'package:flutter/cupertino.dart';

class ProductModel {
  String name, image, description, price;
  String? sale;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.sale,
  });

  factory ProductModel.fromJson(dynamic json) {
    return ProductModel(
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: json['price'],
      sale: json['sale'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'price': price,
      'sale': sale,
    };
  }
}
