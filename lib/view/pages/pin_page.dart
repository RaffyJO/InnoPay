import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/buttons.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  bool isPinError = false;

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isPinError = true;
        });
        showCustomSnackbar(context, 'The PIN you entered is incorrect.');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isPinError = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 58,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter PIN',
                  style: blackTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(
                  height: 72,
                ),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: pinController,
                    obscureText: true,
                    cursorColor: greyColor,
                    obscuringCharacter: '*',
                    enabled: false,
                    style: blackTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16,
                      color: (isPinError) ? redColor : blackColor,
                    ),
                    decoration: InputDecoration(
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 66,
                ),
                Wrap(
                  spacing: 25,
                  runSpacing: 25,
                  children: [
                    CustomInputButton(
                      title: '1',
                      onTap: () {
                        addPin('1');
                      },
                    ),
                    CustomInputButton(
                      title: '2',
                      onTap: () {
                        addPin('2');
                      },
                    ),
                    CustomInputButton(
                      title: '3',
                      onTap: () {
                        addPin('3');
                      },
                    ),
                    CustomInputButton(
                      title: '4',
                      onTap: () {
                        addPin('4');
                      },
                    ),
                    CustomInputButton(
                      title: '5',
                      onTap: () {
                        addPin('5');
                      },
                    ),
                    CustomInputButton(
                      title: '6',
                      onTap: () {
                        addPin('6');
                      },
                    ),
                    CustomInputButton(
                      title: '7',
                      onTap: () {
                        addPin('7');
                      },
                    ),
                    CustomInputButton(
                      title: '8',
                      onTap: () {
                        addPin('8');
                      },
                    ),
                    CustomInputButton(
                      title: '9',
                      onTap: () {
                        addPin('9');
                      },
                    ),
                    const SizedBox(
                      width: 60,
                      height: 60,
                    ),
                    CustomInputButton(
                      title: '0',
                      onTap: () {
                        addPin('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deletePin();
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: blackColor,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
