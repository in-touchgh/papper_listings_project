import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/gallery_provider.dart';
import 'package:paperless_listings/Utils/responsive.dart';
import 'package:paperless_listings/Views/Main/Gallery/gallery_mobile_view.dart';
import 'package:paperless_listings/Views/Main/Gallery/gallery_web_view.dart';
import 'package:provider/provider.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);
  static const String idScreen = '/gallery';

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<GalleryProvider>(context, listen: false).getGalleryImages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: GalleryMobileView(),
      desktop: GalleryWebView(),
    );
  }
}
