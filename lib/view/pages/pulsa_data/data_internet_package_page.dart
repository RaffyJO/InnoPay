import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innopay/blocs/auth/auth_bloc.dart';
import 'package:innopay/blocs/data_internet/data_internet_bloc.dart';
import 'package:innopay/models/data_internet_model.dart';
import 'package:innopay/models/data_internet_plan_model.dart';
import 'package:innopay/models/operator_card_model.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/widgets/forms.dart';
import 'package:innopay/view/widgets/package_item.dart';

class DataInternetPackagePage extends StatefulWidget {
  final OperatorCardModel operatorCard;
  const DataInternetPackagePage({super.key, required this.operatorCard});

  @override
  State<DataInternetPackagePage> createState() =>
      _DataInternetPackagePageState();
}

class _DataInternetPackagePageState extends State<DataInternetPackagePage> {
  final phoneController = TextEditingController();
  DataInternetModel? selectedDataInternet;

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
      body: BlocConsumer<DataInternetBloc, DataInternetState>(
        listener: (context, state) {
          if (state is DataInternetFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is DataInternetSuccess) {
            context.read<AuthBloc>().add(
                  AuthUpdateBalance(
                    selectedDataInternet!.price! * -1,
                  ),
                );

            Navigator.pushNamedAndRemoveUntil(
                context, '/data-internet-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is DataInternetLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
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
                          CustomTextField(
                            title: 'Phone Number',
                            isShowTitle: false,
                            hintText: '08...',
                            textInputType: TextInputType.number,
                            controller: phoneController,
                            onFieldSubmitted: (value) {
                              setState(() {});
                            },
                          )
                        ]),
                  ),
                  verticalSpace(30),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.network(
                          widget.operatorCard.thumbnail.toString(),
                          height: 40,
                        ),
                        horizontalSpace(15),
                        Text(
                          widget.operatorCard.name.toString(),
                          style: blackTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(30),
                  Text(
                    'Select Package',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  verticalSpace(15),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children:
                        widget.operatorCard.dataInternets!.map((dataInternet) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDataInternet = dataInternet;
                          });
                        },
                        child: PackageItem(
                          dataInternet: dataInternet,
                          isSelected:
                              dataInternet.id == selectedDataInternet?.id,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  width: double.infinity,
                  child: (selectedDataInternet == null ||
                          phoneController.text.isEmpty)
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
                          onPressed: () async {
                            if (await Navigator.pushNamed(context, '/pin') ==
                                true) {
                              final authState = context.read<AuthBloc>().state;
                              String pin = '';
                              if (authState is AuthSuccess) {
                                pin = authState.user.pin!;
                              }

                              context.read<DataInternetBloc>().add(
                                    DataInternetPost(
                                      DataInternetPlanModel(
                                          dataInternetId:
                                              selectedDataInternet!.id,
                                          pin: pin,
                                          phoneNumber: phoneController.text),
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
                            'Continue',
                            style: whiteTextStyle.copyWith(
                                fontSize: 14, fontWeight: semiBold),
                          )),
                ),
              ),
              verticalSpace(30)
            ],
          );
        },
      ),
    );
  }
}
