import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class RegisterSuccsessPage extends StatelessWidget {
  const RegisterSuccsessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img_success_register.png',
                width: 200,
              ),
              verticalSpace(30),
              Text(
                'Your Account\nSuccessfully Registered',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              Text(
                'Grow your finance start\ntogether with us',
                style: greyTextStyle.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              verticalSpace(50),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: whiteColor,
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Get Started',
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
