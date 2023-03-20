import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:boklo_mart/core/common/widgets/custom_text_widget.dart';
import 'package:boklo_mart/core/utils/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppConstants {
  /// Show snack bar
  static showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
            alignment: Alignment.center, child: CustomText(text: message)),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  /// Show dialog
  static AwesomeDialog showAwesomeDialog({
    required BuildContext context,
    required DialogType dialogType,
    required String dialogTitle,
    required String message,
    required Color titleColor,
    String? btnOkText,
    String? btnCancelText,
    VoidCallback? onCancelTap,
    VoidCallback? onOkTap,
    void Function(DismissType)? onDismissCallback,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType,
      animType: AnimType.bottomSlide,
      title: dialogTitle,
      titleTextStyle: TextStyle(
          color: titleColor,
          fontWeight: FontWeight.bold,
          fontSize: AppDimensions.font20),
      desc: message,
      descTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: AppDimensions.font16,
          color: Colors.black.withOpacity(0.5)),
      btnOkOnPress: onOkTap,
      onDismissCallback: onDismissCallback,
      btnCancelOnPress: onCancelTap,
      btnOkText: btnOkText,
      btnCancelText: btnCancelText,
    )..show();
  }
}
