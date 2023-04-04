import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../Providers/accounts_provider.dart';
import '../../../../../Utils/app_colors.dart';

class PluginsMobileView extends StatefulWidget {
  const PluginsMobileView({Key? key}) : super(key: key);

  @override
  State<PluginsMobileView> createState() => _PluginsMobileViewState();
}

class _PluginsMobileViewState extends State<PluginsMobileView> {
  @override
  Widget build(BuildContext context) {
    final accountProvider = Provider.of<AccountsProvider>(context);

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                tileColor: Colors.grey[100],
                leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(e['icon'])),
                isThreeLine: true,
                title: Text(
                  e['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e['desc']),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ChoiceChip(
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
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
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              tileColor: Colors.grey[100],
              leading: const CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                    AssetImage('assets/images/shoppinc_cart_plugin.png'),
              ),
              isThreeLine: true,
              title: const Text(
                'Shopping Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                        'This adds a shopping cart to your listings. Users can select products and pay for them'),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ChoiceChip(
                          side: BorderSide(color: AppColors.defaultRed),
                          label: const Text('Enable'),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                          onSelected: (value) {
                            // accountProvider.togglePlugin(e['name'], value);
                          },
                          backgroundColor: AppColors.defaultRed,
                          selectedColor: AppColors.defaultRed,
                          selected: false,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
