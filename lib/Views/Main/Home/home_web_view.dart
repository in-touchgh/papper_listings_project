import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/Widgets/custom_appbar.dart';
import 'package:paperless_listings/Views/Main/Widgets/footer.dart';

class HomeWebView extends StatefulWidget {
  const HomeWebView({Key? key}) : super(key: key);

  @override
  State<HomeWebView> createState() => _HomeWebViewState();
}

class _HomeWebViewState extends State<HomeWebView> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [Footer(controller: scrollController)],
            ),
          ),
        ],
      ),
    );
  }
}
