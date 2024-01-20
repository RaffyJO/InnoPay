import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class RegisterSetProfilePage extends StatelessWidget {
  final TextEditingController pinController = TextEditingController();

  RegisterSetProfilePage({super.key});

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
                  'Join Us To Unlock\nYour Growth',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                verticalSpace(30),
                // Center(
                //   child: Container(
                //     width: 120,
                //     height: 120,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       color: Colors.grey[300],
                //     ),
                //     child: Icon(
                //       Icons.add_a_photo,
                //       size: 40.0,
                //       color: blackColor,
                //     ),
                //   ),
                // ),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/img_photo_profile.png'))),
                  ),
                ),
                verticalSpace(14),
                Center(
                  child: Text('John Doe',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold)),
                ),
                verticalSpace(30),
                CustomTextField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  controller: pinController,
                  textInputType: TextInputType.number,
                ),
                verticalSpace(30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register-set-ktp');
                      },
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
