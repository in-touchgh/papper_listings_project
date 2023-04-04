import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/kyc_provider.dart';
import 'package:paperless_listings/Utils/dialog_utils.dart';
import 'package:paperless_listings/Views/Main/KYC/widgets/doc_container.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../Widgets/custom_appbar.dart';
import '../Widgets/footer.dart';

class KycWebView extends StatefulWidget {
  const KycWebView({Key? key}) : super(key: key);

  @override
  State<KycWebView> createState() => _KycWebViewState();
}

class _KycWebViewState extends State<KycWebView> {
  final scrollController = ScrollController();

  List items = ['ID Card', 'Passport', 'Drivers licence'];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final kycProvider = Provider.of<KycProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: [
                SizedBox(
                  height: size.height - 80,
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Verify your identity',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'For you to post a listing we require you to upload \nan identification document',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Select document type',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 350,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                iconStyleData: const IconStyleData(
                                    icon: Icon(CupertinoIcons.chevron_down)),
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey)),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  elevation: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                hint: const Text('Select document'),
                                value: kycProvider.selectedDoc,
                                items: items
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e),
                                        ))
                                    .toList(),
                                onChanged: kycProvider.setSelectedDoc,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: kycProvider.webImageFront == null &&
                                    kycProvider.imageFront == null ||
                                kycProvider.webImageBack == null &&
                                    kycProvider.imageBack == null
                            ? 350
                            : 500,
                        child: Row(
                          children: [
                            Expanded(
                              child: kycProvider.webImageFront == null &&
                                      kycProvider.imageFront == null
                                  ? InkWell(
                                      onTap: () async {
                                        if (kIsWeb) {
                                          Uint8List? img = await kycProvider
                                              .pickWebImage('front');
                                          kycProvider.setWebFrontImage(img);
                                        } else {
                                          File? img =
                                              await kycProvider.pickImage();
                                          kycProvider.setFrontImage(img);
                                        }
                                      },
                                      child: Container(
                                        width: kycProvider.webImageFront ==
                                                    null &&
                                                kycProvider.imageFront == null
                                            ? 165
                                            : null,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 20),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Image.asset(
                                                  'assets/images/id_front.png'),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Upload an image of the front',
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : DocContainerWeb(
                                      image: kIsWeb
                                          ? kycProvider.webImageFront
                                          : kycProvider.imageFront,
                                      pos: 0,
                                    ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: kycProvider.webImageBack == null &&
                                      kycProvider.imageBack == null
                                  ? InkWell(
                                      onTap: () async {
                                        if (kIsWeb) {
                                          Uint8List? img = await kycProvider
                                              .pickWebImage('back');
                                          kycProvider.setWebBackImage(img);
                                        } else {
                                          File? img =
                                              await kycProvider.pickImage();
                                          kycProvider.setBackImage(img);
                                        }
                                      },
                                      child: Container(
                                        width: kycProvider.webImageBack ==
                                                    null &&
                                                kycProvider.imageBack == null
                                            ? 165
                                            : null,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 20,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: 80,
                                              child: Image.asset(
                                                  'assets/images/id_back.png'),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            const Text(
                                              'Upload an image of the back',
                                              textAlign: TextAlign.center,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : DocContainerWeb(
                                      image: kIsWeb
                                          ? kycProvider.webImageBack
                                          : kycProvider.imageBack,
                                      pos: 1,
                                    ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomButton(
                        onPress: () {
                          if (kycProvider.selectedDoc == null) {
                            DialogUtils.infoDialog(
                                title: 'Upload document',
                                content: "Please select a document type");
                          } else if (kIsWeb &&
                                  kycProvider.webImageFront == null ||
                              !kIsWeb && kycProvider.imageFront == null) {
                            DialogUtils.infoDialog(
                                title: 'Upload document',
                                content: "Please select an image of the front");
                          } else if (kIsWeb &&
                                  kycProvider.webImageBack == null ||
                              !kIsWeb && kycProvider.imageBack == null) {
                            DialogUtils.infoDialog(
                                title: 'Upload document',
                                content: "Please select an image of the back");
                          } else {
                            kycProvider.uploadImages();
                          }
                        },
                        height: 50,
                        width: 350,
                        child: kycProvider.uploading
                            ? const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text('Next'),
                      )
                    ],
                  ),
                ),
                Footer(controller: scrollController),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
