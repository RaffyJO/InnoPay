import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class LastestTransferUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String time;
  final String value;
  final VoidCallback? onTap;

  const LastestTransferUserItem(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.time,
      required this.value,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imgUrl))),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
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
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
            )
          ],
        ),
      ),
    );
  }
}