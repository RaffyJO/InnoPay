import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class MoreDialog extends StatelessWidget {
  const MoreDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        height: 160,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 6,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            verticalSpace(20),
            Text(
              'All Products & Services',
              style:
                  blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 15),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/transfer');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon-friends.png',
                        width: 35,
                      ),
                      verticalSpace(2),
                      Text(
                        'Transfer',
                        style: blackTextStyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/top-up');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon-topup.png',
                        width: 34,
                      ),
                      verticalSpace(2),
                      Text(
                        'Top Up',
                        style: blackTextStyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon-withdraw.png',
                        width: 34,
                      ),
                      verticalSpace(2),
                      Text(
                        'Withdraw',
                        style: blackTextStyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/data-internet');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Image.asset(
                          'assets/icon-data.png',
                          width: 42,
                        ),
                      ),
                      verticalSpace(2),
                      Text(
                        'Internet',
                        style: blackTextStyle.copyWith(
                            fontSize: 13, fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
