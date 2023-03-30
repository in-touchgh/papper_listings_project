import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';

class Utils {
  static PreferredSizeWidget mobileAppBar(
      {required GlobalKey<ScaffoldState> scaffoldKey}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text(
            'Paperless Listings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.defaultRed,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ))
      ],
    );
  }

  static PreferredSizeWidget webAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Text(
            'Paperless Listings',
            style: TextStyle(
              color: AppColors.defaultRed,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        CustomButton(
          onPress: () {},
          child: Row(
            children: const [Icon(Icons.add), Text('Add listings')],
          ),
        )
      ],
    );
  }
}
