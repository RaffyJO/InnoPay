import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final TextEditingController oldPinController = TextEditingController();

  final TextEditingController newPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit PIN',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              Column(
                children: [
                  verticalSpace(30),
                  CustomTextField(
                    title: 'Old PIN',
                    controller: oldPinController,
                    obscureText: true,
                    textInputType: TextInputType.number,
                    onFieldChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'New PIN',
                    controller: newPinController,
                    obscureText: true,
                    textInputType: TextInputType.number,
                    onFieldChanged: (p0) {
                      setState(() {});
                    },
                  ),
                  verticalSpace(50),
                  (oldPinController.text.isEmpty ||
                          newPinController.text.isEmpty)
                      ? SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: null,
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: whiteColor,
                                  backgroundColor: Colors.white54,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: Text(
                                'Update',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 14, fontWeight: semiBold),
                              )),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(
                                      AuthUpdatePin(oldPinController.text,
                                          newPinController.text),
                                    );
                              },
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
          );
        },
      ),
    );
  }
}
