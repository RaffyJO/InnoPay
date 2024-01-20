import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  RegisterPage({super.key});

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
                verticalSpace(40),
                Image.asset(
                  'assets/logo2.png',
                  width: 120,
                ),
                verticalSpace(20),
                Text(
                  "Sign Up Now",
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                Text(
                  "Enter your personal data to enjoy our features",
                  style:
                      greyTextStyle.copyWith(fontWeight: medium, fontSize: 14),
                ),
                verticalSpace(32),
                CustomTextField(
                  title: 'Name',
                  hintText: 'John Doe',
                  controller: nameController,
                ),
                verticalSpace(20),
                CustomTextField(
                  title: 'Email',
                  hintText: 'name@gmail.com',
                  controller: emailController,
                ),
                verticalSpace(20),
                CustomTextField(
                  title: 'Password',
                  hintText: 'Enter password',
                  obscureText: true,
                  controller: passwordController,
                ),
                verticalSpace(32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register-set-profile");
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: orangeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Register',
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )),
                ),
                verticalSpace(32),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(
                      color: greyColor,
                      thickness: 1,
                    ),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'OR',
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      ),
                    ),
                  ],
                ),
                verticalSpace(32),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons_google.png',
                            height: 25,
                          ),
                          horizontalSpace(10),
                          Text(
                            'Sign Up With Google',
                            style:
                                blackTextStyle.copyWith(fontWeight: semiBold),
                          )
                        ]),
                  ),
                ),
                verticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: blackTextStyle.copyWith(fontWeight: semiBold),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: Text(
                          'Sign In',
                          style: orangeTextStyle.copyWith(fontWeight: semiBold),
                        ))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
