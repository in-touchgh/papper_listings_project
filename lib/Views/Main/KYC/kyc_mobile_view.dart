import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/KYC/widgets/doc_container.dart';
import 'package:paperless_listings/Views/Main/Widgets/drawer_widget.dart';
import 'package:paperless_listings/Views/Main/utils.dart';
import 'package:provider/provider.dart';

import '../../../Providers/kyc_provider.dart';
import '../../../Utils/dialog_utils.dart';
import '../../../Widgets/custom_button.dart';

class KycMobileView extends StatefulWidget {
  const KycMobileView({Key? key}) : super(key: key);

  @override
  State<KycMobileView> createState() => _KycMobileViewState();
}

class _KycMobileViewState extends State<KycMobileView> {
  List items = ['ID Card', 'Passport', 'Drivers licence'];

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;
    final kycProvider = Provider.of<KycProvider>(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: Utils.mobileAppBar(scaffoldKey: scaffoldKey),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verify your identity',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
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
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      iconStyleData: const IconStyleData(
                          icon: Icon(CupertinoIcons.chevron_down)),
                      buttonStyleData: ButtonStyleData(
                        height: 50,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              kycProvider.imageFront == null &&
                      kycProvider.webImageFront == null
                  ? InkWell(
                      onTap: () async {
                        if (kIsWeb) {
                          Uint8List? img =
                              await kycProvider.pickWebImage('front');
                          kycProvider.setWebFrontImage(img);
                        } else {
                          File? img = await kycProvider.pickImage();
                          kycProvider.setFrontImage(img);
                        }
                      },
                      child: Container(
                        width: size.width * 0.5,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 30),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.2,
                              child: Image.asset('assets/images/id_front.png'),
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
                  : DocContainer(
                      image: kIsWeb
                          ? kycProvider.webImageFront
                          : kycProvider.imageFront!,
                      pos: 0),
              const SizedBox(
                height: 30,
              ),
              kycProvider.imageBack == null && kycProvider.webImageBack == null
                  ? InkWell(
                      onTap: () async {
                        if (kIsWeb) {
                          Uint8List? img =
                              await kycProvider.pickWebImage('back');
                          kycProvider.setWebBackImage(img);
                        } else {
                          File? img = await kycProvider.pickImage();
                          kycProvider.setBackImage(img);
                        }
                      },
                      child: Container(
                        width: size.width * 0.5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 30,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: size.width * 0.2,
                              child: Image.asset('assets/images/id_back.png'),
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
                  : DocContainer(
                      image: kIsWeb
                          ? kycProvider.webImageBack
                          : kycProvider.imageBack!,
                      pos: 1,
                    ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPress: () {
                  if (kIsWeb && kycProvider.webImageFront == null ||
                      !kIsWeb && kycProvider.imageFront == null) {
                    DialogUtils.infoDialog(
                        title: 'Upload document',
                        content: "Please select an image of the front");
                  } else if (kIsWeb && kycProvider.webImageBack == null ||
                      !kIsWeb && kycProvider.imageBack == null) {
                    DialogUtils.infoDialog(
                        title: 'Upload document',
                        content: "Please select an image of the back");
                  } else {
                    kycProvider.uploadImages();
                  }
                },
                height: 50,
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
      ),
    );
  }
}
