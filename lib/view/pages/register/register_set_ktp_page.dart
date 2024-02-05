import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/models/register_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class RegisterSetKtpPage extends StatefulWidget {
  final RegisterModel data;

  const RegisterSetKtpPage({super.key, required this.data});

  @override
  State<RegisterSetKtpPage> createState() => _RegisterSetKtpPageState();
}

class _RegisterSetKtpPageState extends State<RegisterSetKtpPage> {
  XFile? selectedImage;

  bool validateKtp() {
    if (selectedImage == null) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
            print(state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/register-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            print('crk');
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
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
                      'Verify Your\nAccount',
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
                                      image: FileImage(
                                          File(selectedImage!.path)))),
                          child: (selectedImage != null)
                              ? null
                              : Icon(
                                  Icons.cloud_upload_outlined,
                                  size: 40.0,
                                  color: blackColor,
                                ),
                        ),
                      ),
                    ),
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
                          onPressed: () {
                            if (validateKtp()) {
                              context.read<AuthBloc>().add(
                                    AuthRegister(widget.data.copyWith(
                                      ktp: (selectedImage == null)
                                          ? null
                                          : 'data:image/png;base64${base64Encode(
                                              File(selectedImage!.path)
                                                  .readAsBytesSync(),
                                            )}',
                                    )),
                                  );
                            } else {
                              showCustomSnackbar(
                                  context, 'ID card data cannot be empty');
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
                    verticalSpace(8),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  AuthRegister(widget.data),
                                );
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
          );
        },
      ),
    );
  }
}
