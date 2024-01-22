import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/user_item.dart';

Widget sendAgain() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send Again',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        verticalSpace(15),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HomeUserItem(
                  imgUrl: 'assets/img_photo_profile.png', name: 'Alexandria'),
              HomeUserItem(
                  imgUrl: 'assets/img_photo_profile.png', name: 'Immanuel'),
              HomeUserItem(
                  imgUrl: 'assets/img_photo_profile.png', name: 'Kayshania'),
              HomeUserItem(
                  imgUrl: 'assets/img_photo_profile.png', name: 'Ibrahim'),
              HomeUserItem(
                  imgUrl: 'assets/img_photo_profile.png', name: 'Susilowati'),
            ],
          ),
        )
      ],
    ),
  );
}
