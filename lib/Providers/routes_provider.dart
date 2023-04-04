import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Views/Main/Faqs/faqs_view.dart';
import 'package:paperless_listings/Views/Main/Gallery/gallery_view.dart';
import 'package:paperless_listings/Views/Main/Home/home_view.dart';
import 'package:paperless_listings/Views/Main/account/account_view.dart';

class RoutesProvider extends ChangeNotifier {
  Map _active = {'name': 'FAQ', 'route': FaqsView.idScreen};
  Map _mainActive = {'name': 'Home', 'route': '/home'};

  resetActive() {
    _active = {'name': 'FAQ', 'route': FaqsView.idScreen};
    notifyListeners();
  }

  List routes = [
    {'name': 'About', 'route': '/about'},
    {'name': 'Our menu', 'route': '/menu'},
    {'name': 'Features', 'route': '/features'},
    {'name': 'FAQ', 'route': FaqsView.idScreen},
    {'name': 'Reviews', 'route': '/reviews'},
    {'name': 'Gallery', 'route': GalleryView.idScreen}
  ];

  List mainRoutes = [
    {'name': 'Home', 'route': HomeView.idScreen},
    {'name': 'Explore', 'route': ''},
    {'name': 'Blog', 'route': ''},
    {
      'name': 'FAQ',
      'route': FaqsView.idScreen,
    },
    {'name': 'My account', 'route': AccountView.idScreen},
  ];

  Map get active => _active;
  Map get mainActive => _mainActive;

  setMainActive(Map route) {
    if (_mainActive != route) {
      Get.toNamed(route['route']);
    }
    _mainActive = route;
    notifyListeners();
  }

  setActive(Map route) {
    if (_active != route) {
      Get.toNamed(route['route']);
    }
    _active = route;
    notifyListeners();
  }
}
