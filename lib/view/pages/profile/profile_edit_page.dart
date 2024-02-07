import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/models/user_edit_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      userNameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

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
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile', (route) => false);
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
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: greyColor, width: 0.2),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/img_photo_profile.png'))),
                    ),
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Username',
                    controller: userNameController,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Name',
                    controller: nameController,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Email',
                    controller: emailController,
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    title: 'Password',
                    obscureText: true,
                    controller: passwordController,
                  ),
                  verticalSpace(32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          context.read<AuthBloc>().add(
                                AuthUpdateUser(
                                  UserEditModel(
                                    userName: userNameController.text,
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                ),
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
