import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

Widget userInfo() {
  return Container(
    padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
    width: double.infinity,
    height: 130,
    color: whiteColor,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: greyColor, width: 0.5),
            image: const DecorationImage(
                image: AssetImage('assets/img_photo_profile.png'),
                fit: BoxFit.cover),
          ),
        ),
        horizontalSpace(15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'John Doe',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              Text(
                'johndoe@gmail.com',
                style: greyTextStyle.copyWith(fontSize: 13, fontWeight: medium),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/award_star.png',
              width: 20,
            ),
            horizontalSpace(5),
            Text(
              '1.972 Points',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        )
      ],
    ),
  );
}
