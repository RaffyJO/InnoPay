import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/transaction/transaction_bloc.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/item_lastest_transaction.dart';

Widget lastestTransaction() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Lastest Transaction',
        style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
      ),
      verticalSpace(15),
      BlocProvider(
        create: (context) => TransactionBloc()..add(TransactionGetLast()),
        child: BlocBuilder<TransactionBloc, TransactionState>(
          builder: (context, state) {
            if (state is TransactionSuccess) {
              return (state.transactions.isNotEmpty)
                  ? Column(
                      children: state.transactions.map((transaction) {
                        print(transaction.amount);
                        return ItemLastestTransaction(transaction: transaction);
                      }).toList(),
                    )
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpace(30),
                          Image.asset(
                            'assets/icon-not-found.png',
                            width: 100,
                          ),
                          verticalSpace(3),
                          Text(
                            'No transactions yet',
                            style: blackTextStyle.copyWith(
                                fontSize: 13, fontWeight: semiBold),
                          )
                        ],
                      ),
                    );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    ],
  );
}
