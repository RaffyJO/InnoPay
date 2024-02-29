import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/topup/topup_bloc.dart';
import 'package:innopay/models/payment_method_model.dart';
import 'package:innopay/models/topup_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TopUpAmountPage extends StatefulWidget {
  final PaymentMethodModel paymentMethod;
  final TopupModel data;

  const TopUpAmountPage({
    super.key,
    required this.data,
    required this.paymentMethod,
  });

  @override
  State<TopUpAmountPage> createState() => _TopUpAmountPageState();
}

class _TopUpAmountPageState extends State<TopUpAmountPage> {
  final TextEditingController amountController = TextEditingController();

  late AuthBloc authBloc;

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: orangeColor,
        centerTitle: true,
        title: Text(
          'Top Up',
          style: whiteTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocConsumer<TopupBloc, TopupState>(
              listener: (context, state) async {
                if (state is TopupFailed) {
                  showCustomSnackbar(context, state.e);
                }

                if (state is TopupSuccess) {
                  await launch(state.redirectUrl);

                  context.read<AuthBloc>().add(
                        AuthUpdateBalance(
                          int.parse(
                            amountController.text.replaceAll(".", ""),
                          ),
                        ),
                      );

                  Timer(const Duration(seconds: 2), () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/top-up-success', (route) => false);
                  });
                }
              },
              builder: (context, state) {
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    verticalSpace(30),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          Image.network(
                            widget.paymentMethod.thumbnail.toString(),
                            height: 30,
                          ),
                          horizontalSpace(16),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.paymentMethod.name.toString(),
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                              verticalSpace(2),
                              Text(
                                widget.paymentMethod.status.toString(),
                                style: greyTextStyle.copyWith(
                                    fontSize: 13, fontWeight: semiBold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    verticalSpace(15),
                    Text(
                      'Set Amount',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    verticalSpace(5),
                    TextFormField(
                      controller: amountController,
                      cursorColor: orangeColor,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: blackTextStyle.copyWith(
                          fontSize: 36, fontWeight: medium),
                      decoration: InputDecoration(
                        hintText: '0',
                        prefixIcon: Text(
                          'Rp ',
                          style: blackTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: orangeColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(5),
                    const Text(
                      '* Minimum Top Up Rp 10.000',
                      style: TextStyle(color: Colors.red),
                    )
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthSuccess) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    width: double.infinity,
                    child: (amountController.text == '0' ||
                            amountController.text == '')
                        ? ElevatedButton(
                            onPressed: null,
                            style: ElevatedButton.styleFrom(
                                foregroundColor: whiteColor,
                                backgroundColor: Colors.white54,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Proceed to Top Up',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold),
                            ))
                        : ElevatedButton(
                            onPressed: () async {
                              if (int.tryParse(amountController.text
                                      .replaceAll('.', ''))! >=
                                  10000) {
                                if (await Navigator.pushNamed(
                                        context, '/pin') ==
                                    true) {
                                  final authState =
                                      context.read<AuthBloc>().state;
                                  String pin = '';
                                  if (authState is AuthSuccess) {
                                    pin = authState.user.pin!;
                                  }

                                  context.read<TopupBloc>().add(
                                        TopupPost(
                                          widget.data.copyWith(
                                            pin: pin,
                                            amount: amountController.text
                                                .replaceAll('.', ''),
                                          ),
                                        ),
                                      );
                                }
                              } else {
                                showCustomSnackbar(
                                    context, 'Minimum Top Up Rp 10.000');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: whiteColor,
                                backgroundColor: orangeColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              'Proceed to Top Up',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: semiBold),
                            )),
                  );
                }
                return Container();
              },
            ),
          ),
          verticalSpace(30)
        ],
      ),
    );
  }
}
