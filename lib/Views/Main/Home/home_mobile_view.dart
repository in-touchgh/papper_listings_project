import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/Widgets/drawer_widget.dart';
import 'package:paperless_listings/Views/Main/utils.dart';

class HomeMobileView extends StatelessWidget {
  const HomeMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: Utils.mobileAppBar(
        scaffoldKey: scaffoldKey,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
