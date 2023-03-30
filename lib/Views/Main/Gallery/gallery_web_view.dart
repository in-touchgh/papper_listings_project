import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/gallery_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Utils/app_colors.dart';
import '../Widgets/la_brasserie_reuse.dart';

class GalleryWebView extends StatefulWidget {
  const GalleryWebView({Key? key}) : super(key: key);

  @override
  State<GalleryWebView> createState() => _GalleryWebViewState();
}

class _GalleryWebViewState extends State<GalleryWebView> {
  @override
  Widget build(BuildContext context) {
    final galleryProvider = Provider.of<GalleryProvider>(context);
    final size = MediaQuery.of(context).size;

    return LaBrasserieReuseWeb(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            color: Colors.grey[300],
                          ),
                        )
                      ],
                    ),
                  )
                : Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: galleryProvider.images
                        .map(
                          (e) => Container(
                            color: Colors.grey[100],
                            child: Image.network(
                              e.url,
                              width: (size.width - 140) * 0.5,
                              height: 450,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}

//StaggeredGrid.count(
//                     crossAxisCount: 3,
//                     mainAxisSpacing: 20,
//               crossAxisSpacing: 20,
//               children: galleryProvider.images
//                         .map((e) => StaggeredGridTile.count(
//                           crossAxisCellCount: null,
//                           mainAxisCellCount: ,
//                           child: Container(
//                                 color: Colors.grey[100],
//                                 child: Image.network(
//                                   e.url,
//                                   width: e.width! * 0.5,
//                                   height: e.height! * 0.5,
//                                   // fit: BoxFit.fill,
//                                 ),
//                               ),
//                         )).toList(),
//                   )

//GridView.custom(
//   gridDelegate: SliverQuiltedGridDelegate(
//     crossAxisCount: 4,
//     mainAxisSpacing: 4,
//     crossAxisSpacing: 4,
//     repeatPattern: QuiltedGridRepeatPattern.inverted,
//     pattern: [
//       QuiltedGridTile(2, 2),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 1),
//       QuiltedGridTile(1, 2),
//     ],
//   ),
//   childrenDelegate: SliverChildBuilderDelegate(
//     (context, index) => Tile(index: index),
//   ),
// );

//Wrap(
//                     runSpacing: 20,
//                     spacing: 20,
//                     children: galleryProvider.images
//                         .map((e) => Container(
//                               color: Colors.grey[100],
//                               child: Image.network(
//                                 e.url,
//                                 width: e.width! * 0.5,
//                                 height: e.height! * 0.5,
//                                 // fit: BoxFit.fill,
//                               ),
//                             ))
//                         .toList(),
//                   ),
