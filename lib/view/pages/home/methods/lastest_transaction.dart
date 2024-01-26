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
      ItemLastestTransaction(
          icon: 'assets/icon-friends.png',
          title: 'Transfer',
          time: 'May 29. 2023 - 19:12',
          value: '- ${formatCurrency(600000)}'),
      ItemLastestTransaction(
          icon: 'assets/icon-topup.png',
          title: 'Top Up',
          time: 'May 29. 2023 - 19:12',
          value: '+ ${formatCurrency(260000)}'),
      ItemLastestTransaction(
          icon: 'assets/icon-withdraw.png',
          title: 'Withdraw',
          time: 'May 29. 2023 - 19:12',
          value: '- ${formatCurrency(300000)}'),
      ItemLastestTransaction(
          icon: 'assets/icon-topup.png',
          title: 'Top Up',
          time: 'May 29. 2023 - 19:12',
          value: '+ ${formatCurrency(700000)}'),
    ],
  );
}
