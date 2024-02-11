import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class HomeUserItemEmpty extends StatelessWidget {
  final VoidCallback? onTap;

  const HomeUserItemEmpty({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 100,
        width: 80,
        child: Column(
          children: [
            Container(
              width: 65,
              height: 65,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/btn-add.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            verticalSpace(5),
            Text(
              'Add New',
              style:
                  blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            )
          ],
        ),
      ),
    );
  }
}
