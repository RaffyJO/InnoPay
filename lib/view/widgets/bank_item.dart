import 'package:flutter/material.dart';
import 'package:innopay/models/payment_method_model.dart';
import 'package:innopay/shared/theme.dart';

class BankItem extends StatelessWidget {
  final bool isSelected;
  final PaymentMethodModel paymentMethods;

  const BankItem({
    Key? key,
    this.isSelected = false,
    required this.paymentMethods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 18,
      ),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          width: 2,
          color: isSelected
              ? orangeColor
              : const Color.fromARGB(85, 158, 158, 158),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            paymentMethods.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                paymentMethods.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                paymentMethods.status!,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
