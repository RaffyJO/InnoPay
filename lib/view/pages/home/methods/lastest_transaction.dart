import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/item_lastest_transaction.dart';

Widget lastestTransaction() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Lastest Transaction',
        style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
      ),
      verticalSpace(15),
      const ItemLastestTransaction(
          icon: 'assets/icon-friends.png',
          title: 'Transfer',
          time: 'May 29. 2023 - 19:12',
          value: '- Rp 600.000'),
      const ItemLastestTransaction(
          icon: 'assets/icon-topup.png',
          title: 'Top Up',
          time: 'May 29. 2023 - 19:12',
          value: '+ Rp 260.000'),
      const ItemLastestTransaction(
          icon: 'assets/icon-withdraw.png',
          title: 'Withdraw',
          time: 'May 29. 2023 - 19:12',
          value: '- Rp 300.000'),
      const ItemLastestTransaction(
          icon: 'assets/icon-topup.png',
          title: 'Top Up',
          time: 'May 29. 2023 - 19:12',
          value: '+ Rp 700.000'),
    ],
  );
}
