import 'dart:async';

import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/buttons.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopUpAmountPage extends StatefulWidget {
  const TopUpAmountPage({super.key});

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 58,
          ),
          children: [
            verticalSpace(70),
            Center(
              child: Text(
                'Total Amount',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
            ),
            const SizedBox(
              height: 62,
            ),
            Align(
              child: SizedBox(
                width: 240,
                child: TextFormField(
                  controller: amountController,
                  cursorColor: greyColor,
                  enabled: false,
                  style:
                      blackTextStyle.copyWith(fontSize: 36, fontWeight: medium),
                  decoration: InputDecoration(
                    prefixIcon: Text(
                      'Rp ',
                      style: blackTextStyle.copyWith(
                        fontSize: 36,
                        fontWeight: medium,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomInputButton(
                    title: '1',
                    onTap: () {
                      addAmount('1');
                    },
                  ),
                  CustomInputButton(
                    title: '2',
                    onTap: () {
                      addAmount('2');
                    },
                  ),
                  CustomInputButton(
                    title: '3',
                    onTap: () {
                      addAmount('3');
                    },
                  ),
                  CustomInputButton(
                    title: '4',
                    onTap: () {
                      addAmount('4');
                    },
                  ),
                  CustomInputButton(
                    title: '5',
                    onTap: () {
                      addAmount('5');
                    },
                  ),
                  CustomInputButton(
                    title: '6',
                    onTap: () {
                      addAmount('6');
                    },
                  ),
                  CustomInputButton(
                    title: '7',
                    onTap: () {
                      addAmount('7');
                    },
                  ),
                  CustomInputButton(
                    title: '8',
                    onTap: () {
                      addAmount('8');
                    },
                  ),
                  CustomInputButton(
                    title: '9',
                    onTap: () {
                      addAmount('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomInputButton(
                    title: '0',
                    onTap: () {
                      addAmount('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deleteAmount();
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
            ),
            verticalSpace(50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      await launch('https://demo.midtrans.com/');

                      Timer(const Duration(seconds: 1), () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/top-up-success', (route) => false);
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: whiteColor,
                      backgroundColor: blackColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Continue',
                    style: whiteTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  )),
            ),
            verticalSpace(50)
          ],
        ));
  }
}
