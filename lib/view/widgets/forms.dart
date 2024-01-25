import 'package:flutter/material.dart';
import 'package:innopay/shared/theme.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final bool isShowTitle;

  const CustomTextField(
      {super.key,
      required this.title,
      this.obscureText = false,
      this.controller,
      this.textInputType,
      this.hintText = '',
      this.isShowTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle)
          Text(
            title,
            style: blackTextStyle.copyWith(fontWeight: semiBold),
          ),
        if (isShowTitle)
          const SizedBox(
            height: 8,
          ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.all(12),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: orangeColor),
            ),
          ),
          cursorColor: orangeColor,
        )
      ],
    );
  }
}
