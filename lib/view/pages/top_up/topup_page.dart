import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/bank_item.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          verticalSpace(30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Balance',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
              verticalSpace(2),
              Text(
                'Rp 100.000',
                style:
                    blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
              ),
              verticalSpace(40),
              Text(
                'Select Bank',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              verticalSpace(12),
              const BankItem(
                  name: 'Bank BCA', imgUrl: 'assets/img_bank_bca.png'),
              const BankItem(
                name: 'Bank Mandiri',
                imgUrl: 'assets/img_bank_mandiri.png',
                isSelected: true,
              ),
              const BankItem(
                  name: 'Bank BNI', imgUrl: 'assets/img_bank_bni.png'),
              const BankItem(
                  name: 'Bank OCBC', imgUrl: 'assets/img_bank_ocbc.png'),
              verticalSpace(12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/top-up-amount');
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
              verticalSpace(50)
            ],
          )
        ],
      ),
    );
  }
}
