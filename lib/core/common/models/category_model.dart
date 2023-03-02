import 'package:flutter/material.dart';

class CategoryModel {
  String name, image;

  CategoryModel({required this.name, required this.image});

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(
      name: json['name'],
      image: json['image'],
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
