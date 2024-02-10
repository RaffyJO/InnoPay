import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/more_dialog.dart';

Widget userServices(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/transfer');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-friends.png',
              width: 36.5,
            ),
            verticalSpace(2),
            Text(
              'Transfer',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/top-up');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-topup.png',
              width: 36,
            ),
            verticalSpace(2),
            Text(
              'Top Up',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/upcoming');
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-withdraw.png',
              width: 36,
            ),
            verticalSpace(2),
            Text(
              'Withdraw',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          showDialog(
              context: context, builder: (context) => const MoreDialog());
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon-more.png',
              width: 36,
            ),
            verticalSpace(2),
            Text(
              'More',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        ),
      ),
    ],
  );
}
