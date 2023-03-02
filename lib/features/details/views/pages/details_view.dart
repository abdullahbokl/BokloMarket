import 'package:boklo_mart/core/common/models/product_model.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {

  ProductModel model;

  DetailsView({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.name),
      ),
      body: Center(
        child: Text(model.name),
      ),
    );
  }
}
