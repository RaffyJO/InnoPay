import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/operator_card/operator_card_bloc.dart';
import 'package:innopay/models/operator_card_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/pulsa_data/data_internet_package_page.dart';
import 'package:innopay/view/widgets/internet_item.dart';

class DataInternetPage extends StatefulWidget {
  const DataInternetPage({super.key});

  @override
  State<DataInternetPage> createState() => _DataInternetPageState();
}

class _DataInternetPageState extends State<DataInternetPage> {
  OperatorCardModel? selectedOperatorCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        backgroundColor: lightBackgroundColor,
        centerTitle: true,
        title: Text(
          'Internet Data',
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
                  'Select Provider',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                verticalSpace(12),
                BlocBuilder<OperatorCardBloc, OperatorCardState>(
                  builder: (context, state) {
                    if (state is OperatorCardSuccess) {
                      return Column(
                        children: state.operatorCards.map((operatorCard) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOperatorCard = operatorCard;
                              });
                            },
                            child: InternetItem(
                              operatorCard: operatorCard,
                              isSelected:
                                  operatorCard.id == selectedOperatorCard?.id,
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: (selectedOperatorCard == null)
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
                            builder: (context) => DataInternetPackagePage(
                                operatorCard: selectedOperatorCard!),
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
