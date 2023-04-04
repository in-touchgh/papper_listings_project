import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/KYC/kyc_mobile_view.dart';
import 'package:paperless_listings/Views/Main/KYC/kyc_web_view.dart';

import '../../../Utils/responsive.dart';

class KycView extends StatefulWidget {
  static const String idScreen = '/kyc';
  const KycView({Key? key}) : super(key: key);

  @override
  State<KycView> createState() => _KycViewState();
}

class _KycViewState extends State<KycView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: KycMobileView(),
        desktop: KycWebView(),
      ),
    );
  }
}
