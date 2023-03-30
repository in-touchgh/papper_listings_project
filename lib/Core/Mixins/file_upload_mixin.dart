import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Widgets/custom_button.dart';

mixin FileUploadMixin {
  Future<dio.Response?> postImage(
      {required String route, required File file}) async {
    try {
      var formData = dio.FormData.fromMap({
        'file': await dio.MultipartFile.fromFile(
          file.path,
        ),
        'upload_preset': "ix8u70vl"
      });

      dio.Response res = await dio.Dio().post(
        route,
        data: formData,
      );

      return res;
    } on TimeoutException {
      if (kDebugMode) {
        print("Connection timed out");
      }
      return null;
    } on dio.DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print(e.response!.data);
        }
        return e.response!;
      } else {
        if (kDebugMode) {
          print(e.message);
        }
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print("file upload: $error");
      }
      return null;
    }
  }

  Future<dio.Response?> postWebImage({
    required String route,
    required Uint8List file,
    required String fileName,
  }) async {
    try {
      var formData = dio.FormData.fromMap({
        'file': dio.MultipartFile.fromBytes(file, filename: fileName),
        'upload_preset': "ix8u70vl"
      });

      if (kDebugMode) {
        print(formData.files);
      }

      dio.Response res = await dio.Dio().post(
        route,
        data: formData,
      );

      return res;
    } on TimeoutException {
      if (kDebugMode) {
        print("Connection timed out");
      }
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 80,
        ),
        title: const Text('Upload documents'),
        content: const Text(
          'Connection timed out',
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
      return null;
    } on dio.DioError catch (e) {
      if (e.response != null) {
        if (kDebugMode) {
          print("dio err res: ${e.response!.data}");
        }
        Get.dialog(AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.all(20),
          icon: const Icon(
            Icons.cancel,
            color: Colors.red,
            size: 80,
          ),
          title: const Text('Upload documents'),
          content: Text(
            "${e.response?.data['error']}",
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
        return e.response!;
      } else {
        if (kDebugMode) {
          print(e.message);
        }
        return null;
      }
    } catch (error) {
      if (kDebugMode) {
        print("file upload: $error");
      }
      Get.dialog(AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(20),
        icon: const Icon(
          Icons.cancel,
          color: Colors.red,
          size: 80,
        ),
        title: const Text('Upload documents'),
        content: Text(
          error.toString(),
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
      return null;
    }
  }
}
