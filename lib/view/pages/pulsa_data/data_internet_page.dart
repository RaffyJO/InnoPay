import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/internet_item.dart';

class DataInternetPage extends StatelessWidget {
  const DataInternetPage({super.key});

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
                Text(
                  formatCurrency(100000),
                  style: blackTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                ),
                verticalSpace(40),
                Text(
                  'Select Provider',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                verticalSpace(12),
                const InternetItem(
                    name: 'Telkomsel',
                    imgUrl: 'assets/img_provider_telkomsel.png'),
                const InternetItem(
                  name: 'Indosat Ooredoo',
                  imgUrl: 'assets/img_provider_indosat.png',
                  isSelected: true,
                ),
                const InternetItem(
                    name: 'Singtel ID',
                    imgUrl: 'assets/img_provider_singtel.png'),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/data-internet-package');
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
