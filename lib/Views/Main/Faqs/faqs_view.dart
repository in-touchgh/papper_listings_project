import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/responsive.dart';
import 'package:paperless_listings/Views/Main/Faqs/faqs_mobile_view.dart';
import 'package:paperless_listings/Views/Main/Faqs/faqs_web_view.dart';

class FaqsView extends StatefulWidget {
  const FaqsView({Key? key}) : super(key: key);
  static const String idScreen = '/faqs';

  @override
  State<FaqsView> createState() => _FaqsViewState();
}

class _FaqsViewState extends State<FaqsView> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: FaqsMobileView(),
      desktop: FaqsWebView(),
    );
  }
}
