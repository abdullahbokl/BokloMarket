import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor1 = Color(0xFF01C3CC);
  static const Color primaryColor2 = Color(0xFF3F56F2);
  static const Color secondaryColor = Color(0xFF830D3F);
  static const Color blackHintColor = Color.fromRGBO(0, 0, 0, 0.66);
  static const Color greyHintColor = Colors.grey;
  static const Color searchBarBorderColor = Color(0xFFD9D9D9);




  /// radial gradient
  static Gradient primaryGradient () {
    return const RadialGradient(
      colors: [
        primaryColor1,
        primaryColor2,
      ],
      stops: [
        0.25,
        1.0,
      ],
    );
  }


  static Gradient secondaryGradient () {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        primaryColor1,
        primaryColor2.withOpacity(0.8),
      ],
      stops: const [
        0.25,
        1.0,
      ],
    );
  }


}
