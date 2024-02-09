import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/transfer/transfer_bloc.dart';
import 'package:innopay/models/transfer_model.dart';
import 'package:innopay/models/user_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/transfer/transfer_success_page.dart';
import 'package:intl/intl.dart';

class TransferAmountPage extends StatefulWidget {
  final UserModel userData;
  final TransferModel data;
  const TransferAmountPage({
    super.key,
    required this.data,
    required this.userData,
  });

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColor,
        centerTitle: true,
        title: Text(
          'Send to Friend',
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: BlocConsumer<TransferBloc, TransferState>(
              listener: (context, state) {
                if (state is TransferFailed) {
                  showCustomSnackbar(context, state.e);
                }

                if (state is TransferSuccess) {
                  context.read<AuthBloc>().add(
                        AuthUpdateBalance(
                          int.parse(
                                amountController.text.replaceAll(".", ""),
                              ) *
                              -1,
                        ),
                      );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransferSuccessPage(
                          userData: widget.userData,
                          data: widget.data
                              .copyWith(amount: amountController.text)),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is TransferLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  children: [
                    verticalSpace(30),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (widget.userData.profilePicture == '')
                                      ? const AssetImage(
                                          'assets/user-profile.png')
                                      : NetworkImage(
                                              widget.userData.profilePicture!)
                                          as ImageProvider,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          horizontalSpace(12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.userData.name.toString(),
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: semiBold),
                              ),
                              verticalSpace(2),
                              Text(
                                widget.data.sendTo!,
                                style: greyTextStyle.copyWith(
                                    fontSize: 13, fontWeight: semiBold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    verticalSpace(15),
                    Text(
                      'Set Amount',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    verticalSpace(5),
                    TextFormField(
                      controller: amountController,
                      cursorColor: orangeColor,
                      keyboardType: TextInputType.number,
                      style: blackTextStyle.copyWith(
                          fontSize: 36, fontWeight: medium),
                      decoration: InputDecoration(
                        hintText: '0',
                        prefixIcon: Text(
                          'Rp ',
                          style: blackTextStyle.copyWith(
                            fontSize: 36,
                            fontWeight: medium,
                          ),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: orangeColor,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greyColor,
                          ),
                        ),
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      children: [
                        Text(
                          'Notes',
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        ),
                        horizontalSpace(7),
                        Text('(Optional)',
                            style: greyTextStyle.copyWith(fontWeight: medium))
                      ],
                    ),
                    verticalSpace(12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F7F7),
                        border: Border.all(
                          color: Colors.grey, // Warna border sesuai keinginan
                          width: 0.5, // Lebar border sesuai keinginan
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Boleh disesuaikan
                      ),
                      width: double.infinity,
                      height: 140,
                      child: TextFormField(
                        controller: notesController,
                        cursorColor: orangeColor,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Enter your notes here',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      final authState = context.read<AuthBloc>().state;
                      String pin = '';
                      if (authState is AuthSuccess) {
                        pin = authState.user.pin!;
                      }

                      context.read<TransferBloc>().add(
                            TransferPost(
                              widget.data.copyWith(
                                pin: pin,
                                amount:
                                    amountController.text.replaceAll('.', ''),
                              ),
                            ),
                          );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: whiteColor,
                      backgroundColor: orangeColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    'Proceed to Transfer',
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
