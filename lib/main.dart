import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/data_internet/data_internet_bloc.dart';
import 'package:innopay/blocs/operator_card/operator_card_bloc.dart';
import 'package:innopay/blocs/payment_method/payment_method_bloc.dart';
import 'package:innopay/blocs/topup/topup_bloc.dart';
import 'package:innopay/blocs/transfer/transfer_bloc.dart';
import 'package:innopay/blocs/user/user_bloc.dart';
import 'package:innopay/view/pages/home/home_page.dart';
import 'package:innopay/view/pages/login/login_page.dart';
import 'package:innopay/view/pages/onboarding_page.dart';
import 'package:innopay/view/pages/pin_page.dart';
import 'package:innopay/view/pages/profile/profile_edit_page.dart';
import 'package:innopay/view/pages/profile/profile_edit_pin_page.dart';
import 'package:innopay/view/pages/profile/profile_page.dart';
import 'package:innopay/view/pages/pulsa_data/data_internet_page.dart';
import 'package:innopay/view/pages/pulsa_data/data_internet_success.dart';
import 'package:innopay/view/pages/register/register_page.dart';
import 'package:innopay/view/pages/register/register_success_page.dart';
import 'package:innopay/view/pages/splash_page.dart';
import 'package:innopay/view/pages/top_up/topup_page.dart';
import 'package:innopay/view/pages/top_up/topup_success_page.dart';
import 'package:innopay/view/pages/transfer/transfer_page.dart';
import 'package:innopay/view/pages/upcoming_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
        BlocProvider(
            create: (context) => PaymentMethodBloc()..add(PaymentMethodGet())),
        BlocProvider(create: (context) => TopupBloc()),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => TransferBloc()),
        BlocProvider(
            create: (context) => OperatorCardBloc()..add(OperatorCardGet())),
        BlocProvider(create: (context) => DataInternetBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/register-success': (context) => const RegisterSuccsessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => ProfileEditPinPage(),
          '/top-up': (context) => const TopUpPage(),
          '/top-up-success': (context) => const TopUpSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/data-internet': (context) => const DataInternetPage(),
          '/data-internet-success': (context) =>
              const DataInternetSuccessPage(),
          '/upcoming': (context) => const UpcomingPage(),
        },
      ),
    );
  }
}
