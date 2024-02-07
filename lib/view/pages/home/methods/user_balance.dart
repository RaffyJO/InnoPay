// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class UserBalanceWidget extends StatefulWidget {
  int balance;
  UserBalanceWidget({
    Key? key,
    required this.balance,
  }) : super(key: key);

  @override
  _UserBalanceWidgetState createState() => _UserBalanceWidgetState();
}

class _UserBalanceWidgetState extends State<UserBalanceWidget> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your Balance',
          style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
        ),
        verticalSpace(2),
        (isOpen)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      '  ${formatCurrency(widget.balance)}',
                      style: whiteTextStyle.copyWith(
                        fontSize: 32,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  horizontalSpace(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Icon(
                      Icons.remove_red_eye_rounded,
                      color: whiteColor,
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Text(
                      '  ********',
                      style: whiteTextStyle.copyWith(
                        fontSize: 32,
                        fontWeight: semiBold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  horizontalSpace(8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    child: Image.asset(
                      'assets/visibility_off.png',
                      width: 24,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
