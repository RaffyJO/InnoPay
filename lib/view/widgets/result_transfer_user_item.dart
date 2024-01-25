import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class ResultTransferUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String email;
  final VoidCallback? onTap;

  const ResultTransferUserItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.email,
    this.onTap,
  });

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
                    email,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: semiBold),
                  )
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
