import 'package:flutter/material.dart';
import 'package:innopay/models/user_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class ResultTransferUserItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;
  final VoidCallback? onTap;

  const ResultTransferUserItem({
    super.key,
    this.isSelected = false,
    this.onTap,
    required this.user,
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
                    image: (user.profilePicture == '')
                        ? const AssetImage('assets/user-profile.png')
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                    fit: BoxFit.cover),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name.toString(),
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  verticalSpace(2),
                  Text(
                    user.username!,
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
