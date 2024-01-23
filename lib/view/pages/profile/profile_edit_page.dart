import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class ProfileEditPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Profile',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            children: [
              verticalSpace(30),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: greyColor, width: 0.2),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img_photo_profile.png'))),
                ),
              ),
              verticalSpace(20),
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: whiteColor,
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Update',
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
