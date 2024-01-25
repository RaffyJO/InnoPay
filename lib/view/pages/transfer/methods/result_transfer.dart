import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/result_transfer_user_item.dart';

Widget resultTransfer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        verticalSpace(12),
        ResultTransferUserItem(
          imgUrl: 'assets/img_photo_profile.png',
          name: 'Alexandria',
          email: 'alexandria@gmail.com',
          onTap: () {
            Navigator.pushNamed(context, '/transfer-amount');
          },
        ),
        const ResultTransferUserItem(
          imgUrl: 'assets/img_photo_profile.png',
          name: 'Alexandria',
          email: 'alexandria@gmail.com',
        ),
        const ResultTransferUserItem(
          imgUrl: 'assets/img_photo_profile.png',
          name: 'Alexandria',
          email: 'alexandria@gmail.com',
        ),
      ],
    ),
  );
}
