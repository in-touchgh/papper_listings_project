import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Views/Main/account/account_view.dart';
import 'package:paperless_listings/Views/Main/account/navigation/plugins/plugins_mobile_view.dart';

import '../Widgets/drawer_widget.dart';
import '../utils.dart';

class AccountMobileView extends StatefulWidget {
  const AccountMobileView({Key? key}) : super(key: key);

  @override
  State<AccountMobileView> createState() => _AccountMobileViewState();
}

class _AccountMobileViewState extends State<AccountMobileView> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: Utils.mobileAppBar(scaffoldKey: scaffoldKey),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Material(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AccountView.idScreen);
                    },
                    child: const Text(
                      'Account',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Plugins',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          ),
          const PluginsMobileView()
        ],
      ),
    );
  }
}
