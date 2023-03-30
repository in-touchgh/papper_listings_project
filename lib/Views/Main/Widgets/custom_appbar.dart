import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperless_listings/Views/Main/KYC/kyc_view.dart';
import 'package:provider/provider.dart';

import '../../../Providers/routes_provider.dart';
import '../../../Utils/app_colors.dart';
import '../../../Widgets/custom_button.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    final routesProvider = Provider.of<RoutesProvider>(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                'Paperless Listings',
                style: GoogleFonts.comfortaa(
                  textStyle: TextStyle(
                    color: AppColors.defaultRed,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              ...routesProvider.mainRoutes.map((e) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ChoiceChip(
                    onSelected: (value) {
                      routesProvider.setMainActive(e);
                    },
                    selectedColor: Colors.white,
                    backgroundColor: Colors.white,
                    label: Text(e['name']),
                    labelStyle: TextStyle(
                      color: Get.currentRoute == e['route']
                          ? AppColors.defaultRed
                          : Colors.grey,
                    ),
                    selected: Get.currentRoute == e['route'],
                  ),
                );
              }).toList(),
              CustomButton(
                height: 40,
                onPress: () {
                  Get.toNamed(KycView.idScreen);
                },
                child: Row(
                  children: const [Icon(Icons.add), Text('Add listings')],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
