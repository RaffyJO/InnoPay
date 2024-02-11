import 'package:flutter/material.dart';
import 'package:innopay/models/transaction_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:intl/intl.dart';

class ItemLastestTransaction extends StatelessWidget {
  final TransactionModel transaction;

  String typeIcon(int? id) {
    if (id == 1) {
      return 'assets/icon-friends.png';
    } else if (id == 2) {
      return 'assets/icon-phone.png';
    } else if (id == 3) {
      return 'assets/icon-topup.png';
    } else {
      return 'assets/icon-withdraw.png';
    }
  }

  const ItemLastestTransaction({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.orange[100], shape: BoxShape.circle),
            child: Center(
              child: Image.asset(
                typeIcon(transaction.transactionType!.id!),
                width: 28,
              ),
            ),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackTextStyle.copyWith(
                      fontSize: 14, fontWeight: semiBold),
                ),
                verticalSpace(2),
                Text(
                  DateFormat('MMMM d, y')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyTextStyle.copyWith(
                      fontSize: 12, fontWeight: semiBold),
                )
              ],
            ),
          ),
          Text((transaction.transactionType?.action == 'cr') ? '+ ' : '- ',
              style:
                  blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold)),
          Text(
            formatCurrency(transaction.amount ?? 0),
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
          ),
        ],
      ),
    );
  }
}
