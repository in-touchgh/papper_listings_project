import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/accounts_provider.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Views/Main/Widgets/custom_appbar.dart';
import 'package:paperless_listings/Views/Main/Widgets/footer.dart';
import 'package:provider/provider.dart';

class AccountWebView extends StatefulWidget {
  const AccountWebView({Key? key}) : super(key: key);

  @override
  State<AccountWebView> createState() => _AccountWebViewState();
}

class _AccountWebViewState extends State<AccountWebView> {
  final scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const CustomAppbar(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  color: const Color(0xFFe45f90),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Text(
                    accountProvider.activeNav['name'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  // height: size.height - 80,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Center(
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: AssetImage(
                                      'assets/images/lady_with_flag.png'),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Center(
                                  child: Text(
                                'Aundrey Nana',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                              const Center(
                                  child: Text(
                                'audrey.nana@gmail.com',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              ...accountProvider.navs.map(
                                (e) => ListTile(
                                  leading: e['icon'],
                                  title: Text(
                                    e['name'],
                                    style: TextStyle(
                                      color:
                                          accountProvider.activeNav['name'] ==
                                                  e['name']
                                              ? AppColors.defaultRed
                                              : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      accountProvider.navs.singleWhere((element) =>
                          element['name'] ==
                          accountProvider.activeNav['name'])['widget']
                    ],
                  ),
                ),
                Footer(controller: scrollController),
              ],
            ),
          )
        ],
      ),
    );
  }
}
