import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/responsive.dart';
import 'package:paperless_listings/Views/Main/Home/home_mobile_view.dart';
import 'package:paperless_listings/Views/Main/Home/home_web_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const String idScreen = '/';

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobileView(),
      desktop: HomeWebView(),
    );
  }
}
