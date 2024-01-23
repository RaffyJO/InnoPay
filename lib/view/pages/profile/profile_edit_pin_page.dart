import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';

class ProfileEditPinPage extends StatelessWidget {
  final TextEditingController oldPinController = TextEditingController();
  final TextEditingController newPinController = TextEditingController();

  ProfileEditPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit PIN',
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 20),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Column(
            children: [
              verticalSpace(30),
              CustomTextField(
                title: 'Old PIN',
                controller: oldPinController,
                obscureText: true,
                textInputType: TextInputType.number,
              ),
              verticalSpace(20),
              CustomTextField(
                title: 'New PIN',
                controller: newPinController,
                obscureText: true,
                textInputType: TextInputType.number,
              ),
              verticalSpace(32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: whiteColor,
                        backgroundColor: orangeColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: Text(
                      'Update',
                      style: whiteTextStyle.copyWith(
                          fontSize: 14, fontWeight: semiBold),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
