import 'package:flutter/material.dart';
import 'package:paperless_listings/Providers/accounts_provider.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../../Utils/app_colors.dart';

class PluginsWebView extends StatefulWidget {
  const PluginsWebView({Key? key}) : super(key: key);

  @override
  State<PluginsWebView> createState() => _PluginsWebViewState();
}

class _PluginsWebViewState extends State<PluginsWebView> {
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountsProvider>(context);
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'General',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Divider(
                    thickness: 1.2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ...accountProvider.plugins.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Material(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        child: ListTile(
                          selected: false,
                          tileColor: Colors.white,
                          selectedTileColor: Colors.white,
                          selectedColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(e['icon']),
                          ),
                          title: Text(
                            e['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: Text(e['desc']),
                          trailing: ChoiceChip(
                            side: BorderSide(color: AppColors.defaultRed),
                            label: Text(
                                e['enabled'] == true ? 'Disable' : 'Enable'),
                            labelStyle: TextStyle(
                              color: e['enabled'] == true
                                  ? AppColors.defaultRed
                                  : Colors.white,
                            ),
                            onSelected: (value) {
                              accountProvider.togglePlugin(e['name'], value);
                            },
                            backgroundColor: AppColors.defaultRed,
                            selectedColor: Colors.transparent,
                            selected: e['enabled'],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Unique',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const Divider(
                    thickness: 1.2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      child: ListTile(
                        selected: false,
                        tileColor: Colors.white,
                        selectedTileColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        selectedColor: Colors.white,
                        leading: const CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                              'assets/images/shoppinc_cart_plugin.png'),
                        ),
                        title: const Text(
                          'Shopping Cart',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: const Text(
                            'This adds a shopping cart to your listings. Users can select products and pay for them'),
                        trailing: ChoiceChip(
                          side: BorderSide(color: AppColors.defaultRed),
                          label: const Text('Enable'),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          onSelected: (value) {
                            // accountProvider.togglePlugin(e['name'], value);
                          },
                          backgroundColor: AppColors.defaultRed,
                          selectedColor: Colors.transparent,
                          selected: false,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFfbe8ef),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Do you have specific need?',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'If you have a specific feature you would like to add to your listings. We are glad to help you please tell use exactly what you want.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Feature request',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        // fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Briefly describe what you want',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onPress: () {},
                      height: 30,
                      width: 100,
                      child: const Text('Send'),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
