import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

Widget userInfo({
  required String name,
  required String points,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Text(
            'Hi, $name',
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
        ],
      ),
      Container(
          width: 120,
          height: 32,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/award_star.png',
                width: 20,
              ),
              horizontalSpace(5),
              Text(
                '$points Points',
                style:
                    blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              )
            ],
          ))
    ],
  );
}

String getGreeting() {
  var hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 18) {
    return 'Good Afternoon';
  } else {
    return 'Good Evening';
  }
}
