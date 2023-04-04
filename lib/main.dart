import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paperless_listings/Providers/auth_provider.dart';
import 'package:paperless_listings/Providers/gallery_provider.dart';
import 'package:paperless_listings/Providers/kyc_provider.dart';
import 'package:paperless_listings/Providers/routes_provider.dart';
import 'package:paperless_listings/Views/Authentication/Login/login_view.dart';
import 'package:paperless_listings/Views/Main/Faqs/faqs_view.dart';
import 'package:paperless_listings/Views/Main/Gallery/gallery_view.dart';
import 'package:paperless_listings/Views/Main/Home/home_view.dart';
import 'package:paperless_listings/Views/Main/KYC/kyc_view.dart';
import 'package:paperless_listings/Views/Main/account/account_view.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'Providers/accounts_provider.dart';

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('Paperless Listings');
      setWindowMinSize(const Size(1600, 1000));
      setWindowMaxSize(Size.infinite);
    }
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider1()),
        ChangeNotifierProvider(create: (_) => KycProvider()),
        ChangeNotifierProvider(create: (_) => RoutesProvider()),
        ChangeNotifierProvider(create: (_) => AccountsProvider()),
        ChangeNotifierProvider(create: (_) => GalleryProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const LoginView(),
      initialRoute: '/login',
      routes: {
        LoginView.idScreen: (_) => const LoginView(),
        HomeView.idScreen: (_) => const HomeView(),
        KycView.idScreen: (_) => const KycView(),
        FaqsView.idScreen: (_) => const FaqsView(),
        GalleryView.idScreen: (_) => const GalleryView(),
        AccountView.idScreen: (_) => const AccountView(),
      },
    );
  }
}
