import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/payment_method/payment_method_bloc.dart';
import 'package:innopay/models/payment_method_model.dart';
import 'package:innopay/models/topup_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/top_up/topup_amount_page.dart';
import 'package:innopay/view/widgets/bank_item.dart';

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  PaymentMethodModel? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        centerTitle: true,
        title: Text(
          'Top Up',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(30),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                Text(
                  'Your Balance',
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                ),
                verticalSpace(2),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Text(
                        formatCurrency(state.user.balance ?? 0),
                        style: blackTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      );
                    }
                    return Container();
                  },
                ),
                verticalSpace(40),
                Text(
                  'Select Bank',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                verticalSpace(12),
                BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                  builder: (context, state) {
                    if (state is PaymentMethodSuccess) {
                      return Column(
                        children: state.paymentMethods.map((paymentMethod) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedPaymentMethod = paymentMethod;
                              });
                            },
                            child: BankItem(
                              paymentMethods: paymentMethod,
                              isSelected:
                                  paymentMethod.id == selectedPaymentMethod?.id,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: (selectedPaymentMethod == null)
                  ? ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: Colors.white54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Continue',
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      ))
                  : ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopUpAmountPage(
                              data: TopupModel(
                                  paymentMethodCode:
                                      selectedPaymentMethod?.code),
                              paymentMethod: selectedPaymentMethod!,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: whiteColor,
                          backgroundColor: orangeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Continue',
                        style: whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: semiBold),
                      )),
            ),
          ),
          verticalSpace(30)
        ],
      ),
    );
  }
}
