import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/Widgets/la_brasserie_reuse.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Utils/app_colors.dart';

class FaqsMobileView extends StatefulWidget {
  const FaqsMobileView({Key? key}) : super(key: key);

  @override
  State<FaqsMobileView> createState() => _FaqsMobileViewState();
}

class _FaqsMobileViewState extends State<FaqsMobileView> {
  final pc = PanelController();
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return LaBrasserieReuse(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FAQ',
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
          Accordion(
            maxOpenSections: 1,
            contentHorizontalPadding: 0,
            paddingListHorizontal: 0,
            paddingListTop: 0,
            disableScrolling: true,
            children: [
              AccordionSection(
                leftIcon: const Text(
                  '01',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                rightIcon: Icon(
                  Icons.add,
                  color: AppColors.defaultRed,
                ),
                headerBorderRadius: 5,
                headerBackgroundColor: Colors.grey[100],
                headerBackgroundColorOpened: Colors.grey[100],
                headerPadding: const EdgeInsets.all(15),
                header: const Text('Do they offer take away?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                content: Text(
                  'Yes, La Brasserie offers take away',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                contentHorizontalPadding: 10,
                contentVerticalPadding: 10,
                contentBackgroundColor: Colors.grey[100],
                contentBorderWidth: 0,
                contentBorderRadius: 5,
                contentBorderColor: Colors.transparent,
                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
              AccordionSection(
                leftIcon: const Text(
                  '02',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                rightIcon: Icon(
                  Icons.add,
                  color: AppColors.defaultRed,
                ),
                headerBorderRadius: 5,
                headerBackgroundColor: Colors.grey[100],
                headerBackgroundColorOpened: Colors.grey[100],
                headerPadding: const EdgeInsets.all(15),
                header: const Text('Do you accept mobile money?',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                content: Text(
                  'Yes, La Brasserie accepts mobile money',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                contentHorizontalPadding: 10,
                contentVerticalPadding: 10,
                contentBackgroundColor: Colors.grey[100],
                contentBorderWidth: 0,
                contentBorderRadius: 5,
                contentBorderColor: Colors.transparent,
                // onOpenSection: () => print('onOpenSection ...'),
                // onCloseSection: () => print('onCloseSection ...'),
              ),
            ],
          )
        ],
      ),
    ));
    // Scaffold(
    //   body: SlidingUpPanel(
    //     controller: pc,
    //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    //     color: AppColors.defaultRed,
    //     minHeight: 60,
    //     panel: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     !open ? routesProvider.active['name'] : 'Menu',
    //                     style: const TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500,
    //                     ),
    //                   ),
    //                   IconButton(
    //                     onPressed: () {
    //                       if (pc.isPanelClosed) {
    //                         pc.open();
    //                         setState(() {
    //                           open = true;
    //                         });
    //                       } else {
    //                         pc.close();
    //                         setState(() {
    //                           open = false;
    //                         });
    //                       }
    //                     },
    //                     icon: Icon(
    //                       !open
    //                           ? CupertinoIcons.chevron_up
    //                           : CupertinoIcons.chevron_down,
    //                       color: Colors.white,
    //                     ),
    //                   )
    //                 ],
    //               ),
    //               !open
    //                   ? SizedBox.shrink()
    //                   : Divider(
    //                       thickness: 1.2,
    //                       color: Colors.white,
    //                     )
    //             ],
    //           ),
    //         ),
    //         // SizedBox(height: 20,),
    //         Padding(
    //           padding: EdgeInsets.all(20),
    //           child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: routesProvider.routes.map((e) {
    //                 return Container(
    //                   margin: EdgeInsets.only(bottom: 30),
    //                   child: InkWell(
    //                     onTap: () {
    //                       routesProvider.setActive(e);
    //                     },
    //                     child: Text(
    //                       e['name'],
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontSize: 16,
    //                         fontWeight: FontWeight.w500,
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               }).toList()),
    //         )
    //       ],
    //     ),
    //     body: ListView(
    //       primary: true,
    //       children: [
    //         SizedBox(
    //           height: size.height * 0.5,
    //           width: size.width,
    //           child: Stack(
    //             children: [
    //               SizedBox(
    //                 height: size.height * 0.5,
    //                 width: size.width,
    //                 child: Image.asset(
    //                   'assets/images/faq.jpg',
    //                   fit: BoxFit.cover,
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(
    //                     horizontal: 20.0, vertical: 20),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     const Text(
    //                       'La Brasserie',
    //                       style: TextStyle(
    //                         color: Colors.white,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 24,
    //                       ),
    //                     ),
    //                     Row(
    //                       children: [
    //                         CustomButton(
    //                           onPress: () {},
    //                           height: 40,
    //                           width: 40,
    //                           borderRadius: BorderRadius.circular(20),
    //                           padding: EdgeInsets.zero,
    //                           child: const Icon(
    //                             Icons.phone,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           width: 20,
    //                         ),
    //                         CustomButton(
    //                           onPress: () {},
    //                           height: 40,
    //                           width: 40,
    //                           padding: EdgeInsets.zero,
    //                           borderRadius: BorderRadius.circular(20),
    //                           child: const Icon(
    //                             CupertinoIcons.chat_bubble_text_fill,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //               Positioned(
    //                 left: 0,
    //                 right: 0,
    //                 child: Container(
    //                   height: size.height * 0.5,
    //                   width: size.width,
    //                   padding: const EdgeInsets.symmetric(horizontal: 30),
    //                   child: Center(
    //                     child: Column(
    //                       mainAxisSize: MainAxisSize.max,
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           'Enjoy a healthy Delicious meal',
    //                           style: GoogleFonts.greatVibes(
    //                             fontSize: 30,
    //                             color: Colors.white,
    //                           ),
    //                         ),
    //                         const SizedBox(
    //                           height: 30,
    //                         ),
    //                         const Text(
    //                           'We are an elegant restaurant with a vast range of African food from Cameroon, Nigeria, Kenya. Visit us \nand we promise you a very tasteful meal.',
    //                           textAlign: TextAlign.center,
    //                           style: TextStyle(
    //                             color: Colors.white,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //         Column(
    //           children: [
    //             Container(
    //               color: Colors.grey[100],
    //               padding: const EdgeInsets.symmetric(
    //                 horizontal: 20,
    //                 vertical: 20,
    //               ),
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     'Open now',
    //                     style: TextStyle(
    //                       color: AppColors.defaultRed,
    //                       fontWeight: FontWeight.w600,
    //                       fontSize: 16,
    //                     ),
    //                   ),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.end,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: const [
    //                       Text('Tuesday - Wednesday'),
    //                       SizedBox(
    //                         height: 10,
    //                       ),
    //                       Text(
    //                         '10 AM - 10 PM',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //             const SizedBox(
    //               height: 30,
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Text(
    //                     'FAQ',
    //                     style: TextStyle(
    //                       color: AppColors.defaultRed,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 18,
    //                     ),
    //                   ),
    //                   const Divider(
    //                     thickness: 1.2,
    //                   ),
    //                   const SizedBox(
    //                     height: 30,
    //                   ),
    //                   Accordion(
    //                     maxOpenSections: 1,
    //                     contentHorizontalPadding: 0,
    //                     paddingListHorizontal: 0,
    //                     paddingListTop: 0,
    //                     disableScrolling: true,
    //                     children: [
    //                       AccordionSection(
    //                         leftIcon: const Text(
    //                           '01',
    //                           style: TextStyle(
    //                             color: Colors.grey,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 16,
    //                           ),
    //                         ),
    //                         rightIcon: Icon(
    //                           Icons.add,
    //                           color: AppColors.defaultRed,
    //                         ),
    //                         headerBorderRadius: 5,
    //                         headerBackgroundColor: Colors.grey[100],
    //                         headerBackgroundColorOpened: Colors.grey[100],
    //                         headerPadding: EdgeInsets.all(15),
    //                         header: const Text('Do they offer take away?',
    //                             style: TextStyle(
    //                                 fontSize: 18, fontWeight: FontWeight.bold)),
    //                         content: Text(
    //                           'Yes, La Braissere offers take away',
    //                           style: TextStyle(
    //                             fontSize: 15,
    //                             fontWeight: FontWeight.w500,
    //                             color: Colors.grey[600],
    //                           ),
    //                         ),
    //                         contentHorizontalPadding: 10,
    //                         contentVerticalPadding: 10,
    //                         contentBackgroundColor: Colors.grey[100],
    //                         contentBorderWidth: 0,
    //                         contentBorderRadius: 5,
    //                         contentBorderColor: Colors.transparent,
    //                         // onOpenSection: () => print('onOpenSection ...'),
    //                         // onCloseSection: () => print('onCloseSection ...'),
    //                       ),
    //                       AccordionSection(
    //                         leftIcon: const Text(
    //                           '02',
    //                           style: TextStyle(
    //                             color: Colors.grey,
    //                             fontWeight: FontWeight.bold,
    //                             fontSize: 16,
    //                           ),
    //                         ),
    //                         rightIcon: Icon(
    //                           Icons.add,
    //                           color: AppColors.defaultRed,
    //                         ),
    //                         headerBorderRadius: 5,
    //                         headerBackgroundColor: Colors.grey[100],
    //                         headerBackgroundColorOpened: Colors.grey[100],
    //                         headerPadding: EdgeInsets.all(15),
    //                         header: const Text('Do you accept mobile money?',
    //                             style: TextStyle(
    //                                 fontSize: 18, fontWeight: FontWeight.bold)),
    //                         content: Text(
    //                           'Yes, La Brasserie accepts mobile money',
    //                           style: TextStyle(
    //                             fontSize: 15,
    //                             fontWeight: FontWeight.w500,
    //                             color: Colors.grey[600],
    //                           ),
    //                         ),
    //                         contentHorizontalPadding: 10,
    //                         contentVerticalPadding: 10,
    //                         contentBackgroundColor: Colors.grey[100],
    //                         contentBorderWidth: 0,
    //                         contentBorderRadius: 5,
    //                         contentBorderColor: Colors.transparent,
    //                         // onOpenSection: () => print('onOpenSection ...'),
    //                         // onCloseSection: () => print('onCloseSection ...'),
    //                       ),
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
