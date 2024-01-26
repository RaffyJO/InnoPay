import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: ListView(
        children: [
          verticalSpace(30),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(20)),
                width: double.infinity,
                height: 600,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(15),
                    Image.asset(
                      'assets/icon-success-green.png',
                      width: 72,
                    ),
                    verticalSpace(15),
                    Text(
                      'Transfer Successful',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: semiBold,
                          color: const Color(0xff03B961)),
                    ),
                    verticalSpace(2),
                    Text(
                      'Your transaction was successfull',
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    ),
                    verticalSpace(25),
                    Text(
                      formatCurrency(200000),
                      style: blackTextStyle.copyWith(
                          fontSize: 30, fontWeight: semiBold),
                    ),
                    verticalSpace(25),
                    Text(
                      'Send to',
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold),
                    ),
                    verticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/img_photo_profile.png'))),
                        ),
                        horizontalSpace(12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alexandria',
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            verticalSpace(2),
                            Text(
                              'alexandria@gmail.com',
                              style: greyTextStyle.copyWith(
                                  fontSize: 13, fontWeight: semiBold),
                            )
                          ],
                        ),
                      ],
                    ),
                    verticalSpace(30),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Transaction Details',
                          style: blackTextStyle.copyWith(
                              fontSize: 18, fontWeight: semiBold),
                        )),
                    verticalSpace(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Payment',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        Text(
                          formatCurrency(200000),
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        )
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        Text(
                          'June 12, 2023',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        )
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Time',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        Text(
                          '20:32',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        )
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reference Number',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        Text(
                          'QOIU-0012-ADFE-2234',
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        )
                      ],
                    ),
                    verticalSpace(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fee',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                        Text(
                          formatCurrency(0),
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        )
                      ],
                    ),
                    verticalSpace(30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Payment',
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                        ),
                        Text(
                          formatCurrency(200000),
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: semiBold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              verticalSpace(30),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: orangeColor,
                        backgroundColor: whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Back to Home',
                      style: orangeTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
