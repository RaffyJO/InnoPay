import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }

        if (state is AuthFailed) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/onboarding', (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: orangeColor,
        body: Center(
          child: Container(
            width: 250,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo.png'))),
          ),
        ),
      ),
    );
  }
}
