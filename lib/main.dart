import 'package:flutter/material.dart';
import 'package:innopay/view/pages/home/home_page.dart';
import 'package:innopay/view/pages/login_page.dart';
import 'package:innopay/view/pages/onboarding_page.dart';
import 'package:innopay/view/pages/pin_page.dart';
import 'package:innopay/view/pages/profile/profile_edit_page.dart';
import 'package:innopay/view/pages/profile/profile_edit_pin_page.dart';
import 'package:innopay/view/pages/profile/profile_page.dart';
import 'package:innopay/view/pages/register/register_page.dart';
import 'package:innopay/view/pages/register/register_set_ktp_page.dart';
import 'package:innopay/view/pages/register/register_set_profile_page.dart';
import 'package:innopay/view/pages/register/register_success_page.dart';
import 'package:innopay/view/pages/splash_page.dart';
import 'package:innopay/view/pages/top_up/topup_amount_page.dart';
import 'package:innopay/view/pages/top_up/topup_page.dart';
import 'package:innopay/view/pages/top_up/topup_success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/register-set-profile': (context) => RegisterSetProfilePage(),
        '/register-set-ktp': (context) => const RegisterSetKtpPage(),
        '/register-success': (context) => const RegisterSuccsessPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/pin': (context) => const PinPage(),
        '/profile-edit': (context) => ProfileEditPage(),
        '/profile-edit-pin': (context) => ProfileEditPinPage(),
        '/top-up': (context) => const TopUpPage(),
        '/top-up-amount': (context) => const TopUpAmountPage(),
        '/top-up-success': (context) => const TopUpSuccessPage(),
      },
    );
  }
}
