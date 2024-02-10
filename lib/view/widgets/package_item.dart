import 'package:flutter/material.dart';
import 'package:innopay/models/data_internet_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';

class PackageItem extends StatelessWidget {
  final DataInternetModel dataInternet;
  final bool isSelected;

  const PackageItem({
    super.key,
    this.isSelected = false,
    required this.dataInternet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      height: 100,
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: (isSelected) ? orangeColor : whiteColor, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dataInternet.name.toString(),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          verticalSpace(2),
          Text(
            formatCurrency(dataInternet.price ?? 0),
            style: greyTextStyle.copyWith(fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
