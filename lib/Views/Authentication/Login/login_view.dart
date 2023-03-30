import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paperless_listings/Utils/app_colors.dart';
import 'package:paperless_listings/Utils/responsive.dart';
import 'package:paperless_listings/Views/Main/Home/home_view.dart';
import 'package:paperless_listings/Widgets/custom_button.dart';
import 'package:paperless_listings/Widgets/text_input.dart';

import '../../../Widgets/social_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  static const String idScreen = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: LoginMobileView(),
      desktop: LoginDesktopView(),
    );
  }
}

class LoginMobileView extends StatelessWidget {
  const LoginMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            children: [
              const TextSpan(
                text: 'Paperless ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                  text: 'Listings ',
                  style: TextStyle(color: AppColors.defaultRed))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const TextInput(
                hint: 'Enter email',
                radius: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextInput(
                hint: 'Create password',
                secureText: true,
                radius: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppColors.defaultRed,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onPress: () {
                    Get.to(() => const HomeView());
                  },
                  child: const Text('Login')),
              const SizedBox(
                height: 30,
              ),
              const Center(child: Text('Or')),
              const SizedBox(
                height: 30,
              ),
              SocialButton(
                onPress: () {},
                icon: 'assets/images/google.png',
                side: const BorderSide(
                  color: Colors.grey,
                ),
                label: 'Continue with Google',
                bgColor: Colors.white,
                labelColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              SocialButton(
                onPress: () {},
                icon: 'assets/images/apple.png',
                label: 'Continue with Apple',
                bgColor: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              SocialButton(
                onPress: () {},
                icon: 'assets/images/fb.png',
                iconBg: const Color(0xFF0079fe),
                label: 'Continue with Facebook',
                bgColor: const Color(0xFF0079fe),
              ),
              const SizedBox(
                height: 20,
              ),
              SocialButton(
                onPress: () {},
                icon: 'assets/images/twitter.png',
                label: 'Continue with Twitter',
                bgColor: const Color(0xFF1da0f3),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                          text: 'Join free today ',
                          style: TextStyle(color: AppColors.defaultRed))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginDesktopView extends StatelessWidget {
  const LoginDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/login.jpg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          )),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Paperless Listings',
                          style: GoogleFonts.comfortaa(
                            color: AppColors.defaultRed,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Welcome back'),
                    const Text(
                      'Login to your account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextInput(
                      radius: 10,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const TextInput(
                      secureText: true,
                      radius: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: AppColors.defaultRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                        width: double.infinity,
                        onPress: () {
                          Get.toNamed(HomeView.idScreen);
                        },
                        child: const Text('Login')),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(child: Text('Or')),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialButton(
                      onPress: () {},
                      icon: 'assets/images/google.png',
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      label: 'Continue with Google',
                      bgColor: Colors.white,
                      labelColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialButton(
                      onPress: () {},
                      icon: 'assets/images/apple.png',
                      label: 'Continue with Apple',
                      bgColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialButton(
                      onPress: () {},
                      icon: 'assets/images/fb.png',
                      iconBg: const Color(0xFF0079fe),
                      label: 'Continue with Facebook',
                      bgColor: const Color(0xFF0079fe),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SocialButton(
                      onPress: () {},
                      icon: 'assets/images/twitter.png',
                      label: 'Continue with Twitter',
                      bgColor: const Color(0xFF1da0f3),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Don't have an account? ",
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                                text: 'Join free today ',
                                style: TextStyle(color: AppColors.defaultRed))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
