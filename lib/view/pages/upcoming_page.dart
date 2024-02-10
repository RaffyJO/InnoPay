import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

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
                'assets/icon-coming-soon.png',
                width: 250,
              ),
              verticalSpace(30),
              Text(
                'Coming Soon\nStay Tuned',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              Text(
                'This feature is currently\nunder development',
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
                      'Back To Home',
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
