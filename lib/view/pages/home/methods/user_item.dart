import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final String imgUrl;
  final String name;

  const HomeUserItem({super.key, required this.imgUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 100,
        width: 80,
        child: Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imgUrl))),
            ),
            verticalSpace(5),
            Text(
              name,
              style:
                  blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            )
          ],
        ),
      ),
    );
  }
}
