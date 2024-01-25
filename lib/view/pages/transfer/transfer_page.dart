import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/transfer/methods/result_transfer.dart';
import 'package:innopay/view/widgets/forms.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        centerTitle: true,
        title: Text(
          'Transfer',
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
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                width: double.infinity,
                height: 110,
                color: orangeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace(30),
                        Text(
                          'Your Balance',
                          style: whiteTextStyle.copyWith(fontWeight: semiBold),
                        ),
                        verticalSpace(2),
                        Text(
                          'Rp 100.000',
                          style: whiteTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/top-up');
                      },
                      child: Container(
                          width: 96,
                          height: 36,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icon-topup.png',
                                width: 20,
                              ),
                              horizontalSpace(5),
                              Text(
                                'Top Up',
                                style: orangeTextStyle.copyWith(
                                    fontSize: 14, fontWeight: semiBold),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              ),
              verticalSpace(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search',
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                      verticalSpace(10),
                      const CustomTextField(
                        title: 'Search',
                        isShowTitle: false,
                        hintText: 'by name',
                      )
                    ]),
              ),
              verticalSpace(30),
              // lastestTransfer(context),
              resultTransfer(context),
            ],
          )
        ],
      ),
    );
  }
}
