import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innopay/models/transfer_model.dart';
import 'package:innopay/models/user_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:intl/intl.dart';

class TransferSuccessPage extends StatelessWidget {
  final UserModel userData;
  final TransferModel data;
  const TransferSuccessPage({
    super.key,
    required this.userData,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM d, y').format(currentDate);
    String formattedTime = DateFormat('HH:mm').format(currentDate);

    Random random = Random();
    int randomNumber = random.nextInt(9000) + 1000;

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
                      formatCurrency(
                          int.parse(data.amount!.replaceAll('.', ''))),
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
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (userData.profilePicture == '')
                                    ? const AssetImage(
                                        'assets/user-profile.png')
                                    : NetworkImage(userData.profilePicture!)
                                        as ImageProvider,
                                fit: BoxFit.cover),
                          ),
                        ),
                        horizontalSpace(12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userData.name.toString(),
                              style: blackTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            ),
                            verticalSpace(2),
                            Text(
                              userData.username!,
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
                          formatCurrency(
                              int.parse(data.amount!.replaceAll(".", ''))),
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
                          formattedDate,
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
                          formattedTime,
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
                          'INPY-TNFR-$randomNumber',
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
                          formatCurrency(
                              int.parse(data.amount!.replaceAll('.', ''))),
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
