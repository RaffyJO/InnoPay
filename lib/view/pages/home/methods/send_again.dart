import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/user/user_bloc.dart';
import 'package:innopay/models/transfer_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/user_item.dart';
import 'package:innopay/view/pages/home/methods/user_item_empty.dart';
import 'package:innopay/view/pages/transfer/transfer_amount_page.dart';
import 'package:innopay/view/pages/transfer/transfer_page.dart';

Widget sendAgain() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send Again',
          style: blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        verticalSpace(15),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserSuccess) {
              return (state.users.isNotEmpty)
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
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
                            child: HomeUserItem(user: user));
                      }).toList()),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TransferPage()),
                            );
                          },
                          child: const HomeUserItemEmpty()));
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
