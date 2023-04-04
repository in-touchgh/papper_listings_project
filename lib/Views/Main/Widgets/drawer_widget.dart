import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Views/Main/Faqs/faqs_view.dart';
import 'package:paperless_listings/Views/Main/Home/home_view.dart';
import 'package:paperless_listings/Views/Main/KYC/kyc_view.dart';
import 'package:paperless_listings/Views/Main/account/account_view.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.defaultRed,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Menu',
                        style: TextStyle(color: Colors.white),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ))
                    ],
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 1.5,
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(HomeView.idScreen);
              },
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              title: Text(
                'About',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const ListTile(
              title: Text(
                'Features',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(FaqsView.idScreen);
              },
              title: const Text(
                'FAQ',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              onTap: () {
                Get.toNamed(AccountView.idScreen);
              },
              title: const Text(
                'My account',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  bgColor: Colors.white,
                  onPress: () {
                    Get.toNamed(KycView.idScreen);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.defaultRed,
                      ),
                      Text(
                        'Add listings',
                        style: TextStyle(
                          color: AppColors.defaultRed,
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
