import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innopay/models/register_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/register/register_set_ktp_page.dart';
import 'package:innopay/view/widgets/forms.dart';

class RegisterSetProfilePage extends StatefulWidget {
  final RegisterModel data;

  const RegisterSetProfilePage({super.key, required this.data});

  @override
  State<RegisterSetProfilePage> createState() => _RegisterSetProfilePageState();
}

class _RegisterSetProfilePageState extends State<RegisterSetProfilePage> {
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmationPinController =
      TextEditingController();

  XFile? selectedImage;

  bool validatePin() {
    if (pinController.text.length == 6) {
      return true;
    }

    return false;
  }

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
                verticalSpace(70),
                Center(
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 180,
                  ),
                ),
                verticalSpace(70),
                Text(
                  'Join Us To Unlock\nYour Growth',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 20),
                ),
                verticalSpace(30),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      final image = await selectImage();
                      setState(() {
                        selectedImage = image;
                      });
                    },
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                          image: (selectedImage == null)
                              ? null
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(selectedImage!.path)))),
                      child: (selectedImage != null)
                          ? null
                          : Icon(
                              Icons.add_a_photo,
                              size: 40.0,
                              color: blackColor,
                            ),
                    ),
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
                verticalSpace(12),
                CustomTextField(
                  title: 'Confirmation PIN',
                  obscureText: true,
                  controller: confirmationPinController,
                  textInputType: TextInputType.number,
                ),
                verticalSpace(30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (validatePin()) {
                          if (pinController.text ==
                              confirmationPinController.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterSetKtpPage(
                                    data: RegisterModel(
                                        pin: pinController.text,
                                        profilePicture: (selectedImage == null)
                                            ? null
                                            : 'data:image/png;base64,${base64Encode(
                                                File(selectedImage!.path)
                                                    .readAsBytesSync(),
                                              )}'),
                                  ),
                                ));
                          } else {
                            showCustomSnackbar(context,
                                'Your confirmation PIN is not the same');
                          }
                        } else {
                          showCustomSnackbar(context, 'PIN must be 6 digits');
                        }
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
