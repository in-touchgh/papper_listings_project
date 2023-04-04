import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paperless_listings/Views/Main/account/navigation/plugins/plugins_web_view.dart';

class AccountsProvider extends ChangeNotifier {
  Map activeNav = {
    'name': 'Plugins',
    'widget': const PluginsWebView(),
    'icon': const Icon(Icons.ac_unit_outlined)
  };

  List<Map> navs = [
    {
      'name': 'Dashboard',
      'widget': const PluginsWebView(),
      'icon': const Icon(Icons.dashboard_outlined)
    },
    {
      'name': 'Profile',
      'widget': const PluginsWebView(),
      'icon': const Icon(CupertinoIcons.person)
    },
    {
      'name': 'My listings',
      'widget': const PluginsWebView(),
      'icon': const Icon(Icons.list_alt_rounded)
    },
    {
      'name': 'Favorites',
      'widget': const PluginsWebView(),
      'icon': const Icon(Icons.favorite_outline_rounded)
    },
    {
      'name': 'Plugins',
      'widget': const PluginsWebView(),
      'icon': const Icon(Icons.pages_outlined)
    }
  ];

  List plugins = [
    {
      'icon': 'assets/images/about_plugin_icon.png',
      'name': 'About Section',
      'desc': 'Add an about section to your listings pages',
      'enabled': false
    },
    {
      'icon': 'assets/images/chat_plugin_icon.png',
      'name': 'Live Chat',
      'desc': 'Include a live chat functionality in your listings',
      'enabled': true
    },
    {
      'icon': 'assets/images/faq_plugin_icon.png',
      'name': 'FAQ',
      'desc': 'Add an FAQ section to your listings pages',
      'enabled': false
    },
    {
      'icon': 'assets/images/reviews_plugin_icon.png',
      'name': 'Reviews',
      'desc': 'Allow users to add reviews to your listings',
      'enabled': false
    },
    {
      'icon': 'assets/images/ammenities_plugin_icon.png',
      'name': 'Utilities',
      'desc': 'Add a utilities/amenities section to your listings pages',
      'enabled': false
    },
  ];

  togglePlugin(String name, bool value) {
    plugins.singleWhere((element) => element['name'] == name)['enabled'] =
        value;
    notifyListeners();
  }

  goToNav(value) {
    activeNav = value;
    notifyListeners();
  }
}
