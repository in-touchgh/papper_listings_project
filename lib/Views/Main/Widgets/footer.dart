import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Views/Main/Home/home_view.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';

import '../Faqs/faqs_view.dart';

class Footer extends StatelessWidget {
  final ScrollController controller;
  const Footer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const servicesRoutes = [
      {'name': 'Home', 'route': HomeView.idScreen},
      {'name': "Explore", 'route': '/explore'},
      {'name': "FAQ", 'route': FaqsView.idScreen},
      {'name': "Blog", 'route': '/blog'},
    ];

    const aboutRoutes = [
      {'name': 'About us', 'route': '/about'},
      {'name': "Contact us", 'route': '/contact'},
      {'name': "Terms of use", 'route': '/terms'},
      {'name': "Privacy policy", 'route': '/privacy'},
    ];

    return Container(
      color: AppColors.footerBg,
      padding: const EdgeInsets.only(
        left: 100,
        right: 100,
        top: 50,
        bottom: 100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Paperless Listings',
                          style: TextStyle(
                            color: AppColors.defaultRed,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Copyright 2022, All rights reserved',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Services',
                          style: TextStyle(
                            color: AppColors.defaultRed,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...servicesRoutes
                            .map((e) => InkWell(
                                  onTap: () {
                                    Get.toNamed(e['route']!);
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: Text(
                                      e['name']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ))
                            .toList()
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: TextStyle(
                            color: AppColors.defaultRed,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...aboutRoutes
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  Get.toNamed(e['route']!);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    e['name']!,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        controller.animateTo(
                          0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: AppColors.defaultRed,
                        child: const Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Subscribe to our \nnewsletter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 250,
                        child: TextField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            hintText: 'Email address',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        onPress: () {},
                        width: 45,
                        height: 45,
                        padding: const EdgeInsets.all(10),
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(5)),
                        child: const Icon(Icons.chevron_right_rounded),
                      )
                    ],
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.asset(
                      'assets/images/playstore2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: Image.asset(
                      'assets/images/appstore.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/fb-white.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/twitter-white.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/ig-white.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
