import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Views/Main/Widgets/la_brasserie_reuse.dart';

class FaqsWebView extends StatefulWidget {
  const FaqsWebView({Key? key}) : super(key: key);

  @override
  State<FaqsWebView> createState() => _FaqsWebViewState();
}

class _FaqsWebViewState extends State<FaqsWebView> {
  final scrollController = ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LaBrasserieReuseWeb(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
          vertical: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently asked questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.defaultRed,
              ),
            ),
            const Divider(
              thickness: 1.2,
            ),
            const SizedBox(
              height: 20,
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
                  headerPadding: const EdgeInsets.all(25),
                  header: const Text('Do they offer take away?',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  content: Text(
                    'Yes, La Braissere offers take away',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  ),
                  contentHorizontalPadding: 20,
                  contentVerticalPadding: 20,
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
                  headerPadding: const EdgeInsets.all(25),
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
                  contentHorizontalPadding: 20,
                  contentVerticalPadding: 20,
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
      ),
    );
  }
}
