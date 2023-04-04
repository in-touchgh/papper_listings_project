import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/Widgets/la_brasserie_reuse.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Providers/gallery_provider.dart';
import '../../../Utils/app_colors.dart';

class GalleryMobileView extends StatefulWidget {
  const GalleryMobileView({Key? key}) : super(key: key);

  @override
  State<GalleryMobileView> createState() => _GalleryMobileViewState();
}

class _GalleryMobileViewState extends State<GalleryMobileView> {
  @override
  Widget build(BuildContext context) {
    final galleryProvider = Provider.of<GalleryProvider>(context);

    return LaBrasserieReuse(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gallery',
              style: TextStyle(
                color: AppColors.defaultRed,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const Divider(
              thickness: 1.2,
            ),
            const SizedBox(
              height: 30,
            ),
            galleryProvider.loading
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 350,
                      width: double.infinity,
                    ),
                  )
                : Column(
                    children: galleryProvider.images
                        .map(
                          (e) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.only(bottom: 20),
                            height: 350,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                e.url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
