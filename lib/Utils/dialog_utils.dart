import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Utils/app_colors.dart';

import '../Widgets/custom_button.dart';

class DialogUtils {
  static infoDialog({String? title, String? content}) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.info,
        color: Colors.blue,
        size: 80,
      ),
      title: title == null ? null : Text(title),
      content: content == null
          ? null
          : Text(
              content,
              textAlign: TextAlign.center,
            ),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        CustomButton(
          onPress: () {
            Get.back();
          },
          child: const Text('Okay'),
        )
      ],
    ));
  }

  static errorDialog({String? title, String? content}) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      icon: Icon(
        Icons.cancel,
        color: AppColors.defaultRed,
        size: 80,
      ),
      title: title == null ? null : Text(title),
      content: content == null
          ? null
          : Text(
              content,
              textAlign: TextAlign.center,
            ),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        CustomButton(
          onPress: () {
            Get.back();
          },
          child: const Text('Okay'),
        )
      ],
    ));
  }

  static successDialog({String? title, String? content}) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.all(20),
      icon: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 80,
      ),
      title: title == null ? null : Text(title),
      content: content == null
          ? null
          : Text(
              content,
              textAlign: TextAlign.center,
            ),
      actionsPadding: const EdgeInsets.all(20),
      actions: [
        CustomButton(
          onPress: () {
            Get.back();
          },
          child: const Text('Okay'),
        )
      ],
    ));
  }
}
