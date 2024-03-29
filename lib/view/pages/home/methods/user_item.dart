import 'package:flutter/material.dart';
import 'package:innopay/models/user_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onTap;

  const HomeUserItem({super.key, required this.user, this.onTap});

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
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: (user.profilePicture == '' ||
                            user.profilePicture == null)
                        ? const AssetImage('assets/user-profile.png')
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                    fit: BoxFit.cover),
              ),
            ),
            verticalSpace(5),
            Text(
              user.name.toString().split(' ').first,
              style:
                  blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            )
          ],
        ),
      ),
    );
  }
}
