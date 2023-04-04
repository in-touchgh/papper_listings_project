import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/kyc_provider.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/app_colors.dart';

class DocContainer extends StatelessWidget {
  final dynamic image;
  final int pos;
  const DocContainer({Key? key, required this.image, required this.pos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kycProvider = Provider.of<KycProvider>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: 150,
      width: size.width * 0.6,
      child: Stack(
        children: [
          SizedBox(
            height: 150,
            width: size.width * 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: kIsWeb
                  ? Image.memory(
                      image,
                      fit: BoxFit.fill,
                    )
                  : Image.file(
                      image,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            right: -10,
            top: -10,
            child: IconButton(
              onPressed: () {
                pos == 0
                    ? kycProvider.setFrontImage(null)
                    : kycProvider.setBackImage(null);
              },
              icon: Icon(
                CupertinoIcons.clear_circled_solid,
                color: AppColors.defaultRed,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DocContainerWeb extends StatelessWidget {
  final dynamic image;
  final int pos;
  const DocContainerWeb({Key? key, required this.image, required this.pos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kycProvider = Provider.of<KycProvider>(context);

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      height: 130,
      width: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: 130,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: !kIsWeb
                  ? Image.file(
                      image,
                      fit: BoxFit.fill,
                    )
                  : Image.memory(
                      image,
                      fit: BoxFit.fill,
                    ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: () {
                pos == 0
                    ? kycProvider.setWebFrontImage(null)
                    : kycProvider.setWebBackImage(null);
              },
              icon: Icon(
                CupertinoIcons.clear_circled_solid,
                color: AppColors.defaultRed,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
