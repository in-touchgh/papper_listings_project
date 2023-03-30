import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/responsive.dart';

import 'account_mobile_view.dart';
import 'account_web_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);
  static const String idScreen = '/account';

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: AccountMobileView(), desktop: AccountWebView());
  }
}
