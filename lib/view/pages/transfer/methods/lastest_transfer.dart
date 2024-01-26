import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/transfer_user_item.dart';

Widget lastestTransfer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lastest Transfer',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        verticalSpace(12),
        LastestTransferUserItem(
          imgUrl: 'assets/img_photo_profile.png',
          name: 'Alexandria',
          time: 'May 31, 2023 - 09:13',
          value: formatCurrency(600000),
        ),
        LastestTransferUserItem(
            imgUrl: 'assets/img_photo_profile.png',
            name: 'Alexandria',
            time: 'May 31, 2023 - 09:13',
            value: formatCurrency(600000)),
        LastestTransferUserItem(
            imgUrl: 'assets/img_photo_profile.png',
            name: 'Alexandria',
            time: 'May 31, 2023 - 09:13',
            value: formatCurrency(600000)),
      ],
    ),
  );
}
