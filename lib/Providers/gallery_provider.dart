import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paperless_listings/Models/gallery_model.dart';
import 'package:paperless_listings/Services/gallery_service.dart';
import 'package:paperless_listings/Utils/dialog_utils.dart';

class GalleryProvider extends ChangeNotifier {
  List<GalleryModel> _images = [];
  bool _loading = false;

  List<GalleryModel> get images => _images;
  bool get loading => _loading;

  getGalleryImages() async {
    _loading = true;
    notifyListeners();

    http.Response? res = await GalleryService().getGalleryImages();
    _loading = false;
    notifyListeners();

    if (res != null) {
      final resData = jsonDecode(res.body);
      if (res.statusCode == 200) {
        _images =
            (resData as List).map((e) => GalleryModel.fromJson(e)).toList();
        notifyListeners();
      } else {
        DialogUtils.errorDialog(
            title: 'Gallery images', content: 'Oops! An error occurred');
      }
    }
  }
}
