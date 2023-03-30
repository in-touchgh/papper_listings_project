import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:paperless_listings/Services/kyc_service.dart';
import 'package:paperless_listings/Utils/dialog_utils.dart';

class KycProvider extends ChangeNotifier {
  String? _selectedDoc;
  File? _imageFront;
  File? _imageBack;

  bool _uploading = false;

  Uint8List? _webImageFront;
  Uint8List? _webImageBack;
  String? webFrontFileName;
  String? webBackFileName;

  String? get selectedDoc => _selectedDoc;
  File? get imageFront => _imageFront;
  File? get imageBack => _imageBack;
  bool get uploading => _uploading;

  Uint8List? get webImageFront => _webImageFront;
  Uint8List? get webImageBack => _webImageBack;

  setSelectedDoc(value) {
    _selectedDoc = value.toString();
    notifyListeners();
  }

  setFrontImage(File? image) {
    _imageFront = image;
    notifyListeners();
  }

  setBackImage(File? image) {
    _imageBack = image;
    notifyListeners();
  }

  setWebFrontImage(Uint8List? image) {
    _webImageFront = image;
    notifyListeners();
  }

  setWebBackImage(Uint8List? image) {
    _webImageBack = image;
    notifyListeners();
  }

  Future<File?> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);
      return file;
    } else {
      // User canceled the picker
      return null;
    }
  }

  Future<Uint8List?> pickWebImage(String side) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        Uint8List file = result.files.single.bytes!;
        if (side == 'front') {
          webFrontFileName = result.files.single.name;
          notifyListeners();
        } else {
          webBackFileName = result.files.single.name;
          notifyListeners();
        }
        return file;
      } else {
        // User canceled the picker

        return null;
      }
    } catch (err) {
      return null;
    }
  }

  uploadImages() async {
    _uploading = true;
    notifyListeners();

    dio.Response? res1 = await KycService().uploadImage(
      data: kIsWeb ? _webImageFront : _imageFront,
      fileName: webFrontFileName,
    );

    if (res1 != null) {
      if (res1.statusCode == 200) {
        if (kDebugMode) {
          print("res1 data: ${res1.data}");
        }
        dio.Response? res2 = await KycService().uploadImage(
          data: kIsWeb ? _webImageBack : _imageBack,
          fileName: webBackFileName,
        );
        _uploading = false;
        notifyListeners();

        if (res2 != null) {
          if (res2.statusCode == 200) {
            if (kDebugMode) {
              _webImageFront = null;
              _imageFront = null;
              _webImageBack = null;
              _imageBack = null;
              notifyListeners();

              print("res2 data: ${res2.data}");
              DialogUtils.successDialog(
                title: 'Upload document',
                content: 'Documents uploaded successfully',
              );
            }
          }
        }
      } else {
        _uploading = false;
        notifyListeners();
      }
    } else {
      _uploading = false;
      notifyListeners();
    }
  }
}
