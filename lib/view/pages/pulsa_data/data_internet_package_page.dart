import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';
import 'package:innopay/view/widgets/package_item.dart';

class DataInternetPackagePage extends StatelessWidget {
  const DataInternetPackagePage({super.key});

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
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              verticalSpace(30),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Phone Number',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      verticalSpace(10),
                      const CustomTextField(
                        title: 'Phone Number',
                        isShowTitle: false,
                        hintText: '+628',
                        textInputType: TextInputType.number,
                      )
                    ]),
              ),
              verticalSpace(30),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/img_provider_indosat.png',
                      height: 40,
                    ),
                    horizontalSpace(15),
                    Text(
                      "Indosat Ooredoo",
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    )
                  ],
                ),
              ),
              verticalSpace(30),
              Text(
                'Select Package',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
              verticalSpace(15),
              const Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  PackageItem(amount: 10, price: 11000),
                  PackageItem(
                    amount: 20,
                    price: 21000,
                    isSelected: true,
                  ),
                  PackageItem(amount: 30, price: 31000),
                  PackageItem(amount: 40, price: 41000),
                ],
              ),
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/data-internet-success', (route) => false);
                    }
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
