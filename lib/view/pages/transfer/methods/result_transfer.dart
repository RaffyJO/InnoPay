import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/user/user_bloc.dart';
import 'package:innopay/models/transfer_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/transfer/transfer_amount_page.dart';
import 'package:innopay/view/widgets/result_transfer_user_item.dart';

Widget resultTransfer(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Result',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
        ),
        verticalSpace(12),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return (state.users.isNotEmpty)
                  ? Column(
                      children: state.users.map((user) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TransferAmountPage(
                                  data: TransferModel(sendTo: user.username),
                                  userData: user,
                                ),
                              ),
                            );
                          },
                          child: ResultTransferUserItem(user: user));
                    }).toList())
                  : Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          verticalSpace(100),
                          Image.asset(
                            'assets/icon-not-found.png',
                            width: 120,
                          ),
                          verticalSpace(2),
                          Text(
                            'User not found',
                            style: blackTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          )
                        ],
                      ),
                    );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    ),
  );
}
