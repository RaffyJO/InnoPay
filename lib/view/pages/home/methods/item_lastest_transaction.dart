import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class ItemLastestTransaction extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final String value;

  const ItemLastestTransaction(
      {super.key,
      required this.icon,
      required this.title,
      required this.time,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.orange[100], shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                icon,
                width: 28,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                verticalSpace(2),
                Text(
                  time,
                  style: greyTextStyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                )
              ],
            ),
          ),
          Text(
            value,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
