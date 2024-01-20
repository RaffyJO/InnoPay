import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class RegisterSetKtpPage extends StatelessWidget {
  const RegisterSetKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(80),
                Center(
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 180,
                  ),
                ),
                verticalSpace(80),
                Text(
                  'Verify Your\nAccount',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                verticalSpace(30),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    child: Icon(
                      Icons.cloud_upload_outlined,
                      size: 40.0,
                      color: blackColor,
                    ),
                  ),
                ),
                // Center(
                //   child: Container(
                //     width: 120,
                //     height: 120,
                //     decoration: const BoxDecoration(
                //         shape: BoxShape.circle,
                //         image: DecorationImage(
                //             fit: BoxFit.cover,
                //             image: AssetImage('assets/img_photo_profile.png'))),
                //   ),
                // ),
                verticalSpace(14),
                Center(
                  child: Text('ID Card/Passport',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold)),
                ),
                verticalSpace(50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: orangeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Continue',
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )),
                ),
                verticalSpace(8),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/register-success', (route) => false);
                      },
                      child: Text(
                        'Skip for now',
                        style: orangeTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
