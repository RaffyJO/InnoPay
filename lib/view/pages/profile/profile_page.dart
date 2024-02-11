import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/profile/methods/profile_item.dart';
import 'package:innopay/view/pages/profile/methods/user_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              children: [
                Column(
                  children: [
                    userInfo(
                      name: state.user.name!,
                      userName: state.user.username!,
                      profilePicture: state.user.profilePicture!,
                      points: '0',
                    ),
                    verticalSpace(10),
                    Container(
                      color: whiteColor,
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      width: double.infinity,
                      height: 220,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profileItem(
                            'Edit Profile',
                            const Icon(
                              Icons.person_2_outlined,
                              size: 28,
                            ),
                            onTap: () async {
                              if (await Navigator.pushNamed(context, '/pin') ==
                                  true) {
                                Navigator.pushNamed(context, '/profile-edit');
                              }
                            },
                          ),
                          verticalSpace(5),
                          profileItem(
                            'My PIN',
                            const Icon(
                              Icons.pin_outlined,
                              size: 28,
                            ),
                            onTap: () async {
                              if (await Navigator.pushNamed(context, '/pin') ==
                                  true) {
                                Navigator.pushNamed(
                                    context, '/profile-edit-pin');
                              }
                            },
                          ),
                          verticalSpace(5),
                          profileItem(
                            'Wallet Settings',
                            const Icon(
                              Icons.account_balance_wallet_outlined,
                              size: 28,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/upcoming');
                            },
                          ),
                          verticalSpace(5),
                          profileItem(
                              'Points',
                              const Icon(
                                Icons.celebration_outlined,
                                size: 28,
                              ), onTap: () {
                            Navigator.pushNamed(context, '/upcoming');
                          }, isDivider: false),
                        ],
                      ),
                    ),
                    verticalSpace(10),
                    Container(
                      color: whiteColor,
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      width: double.infinity,
                      height: 165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          profileItem(
                            'Help Center',
                            const Icon(
                              Icons.help_outline,
                              size: 28,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/upcoming');
                            },
                          ),
                          verticalSpace(5),
                          profileItem(
                            'Terms & Conditions',
                            const Icon(
                              Icons.file_copy_outlined,
                              size: 28,
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, '/upcoming');
                            },
                          ),
                          verticalSpace(5),
                          profileItem(
                              'Privacy Policy',
                              const Icon(
                                Icons.info_outline_rounded,
                                size: 28,
                              ), onTap: () {
                            Navigator.pushNamed(context, '/upcoming');
                          }, isDivider: false),
                        ],
                      ),
                    ),
                    verticalSpace(50),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<AuthBloc>().add(AuthLogout());
                          },
                          style: ElevatedButton.styleFrom(
                              foregroundColor: whiteColor,
                              backgroundColor: orangeColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: Text(
                            'Log Out',
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          )),
                    ),
                    verticalSpace(20),
                    Text(
                      'Version 0.0.1',
                      style: blackTextStyle.copyWith(
                          fontSize: 14, fontWeight: medium),
                    ),
                  ],
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
