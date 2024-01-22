import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/lastest_transaction.dart';
import 'package:innopay/view/pages/home/methods/send_again.dart';
import 'package:innopay/view/pages/home/methods/user_balance.dart';
import 'package:innopay/view/pages/home/methods/user_info.dart';
import 'package:innopay/view/pages/home/methods/user_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: orangeColor,
      body: Stack(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: statusBarHeight + 24, left: 24, right: 24),
            child: Column(
              children: [
                userInfo(),
                verticalSpace(30),
                const UserBalanceWidget(),
                verticalSpace(40),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.59,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(60),
                    sendAgain(),
                    verticalSpace(15),
                    lastestTransaction()
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                transform: Matrix4.translationValues(0, -100, 0),
                width: MediaQuery.of(context).size.width - 48,
                height: 80,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey, // Warna bayangan
                      offset: Offset(0, 1), // Posisi bayangan (x, y)
                      blurRadius: 2, // Radius blur bayangan
                      spreadRadius: 0.1, // Sebaran bayangan
                    ),
                  ],
                ),
                child: userServices()),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: orangeColor,
          unselectedItemColor: greyColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: orangeTextStyle.copyWith(fontWeight: semiBold),
          unselectedLabelStyle: greyTextStyle.copyWith(fontWeight: semiBold),
          selectedFontSize: 12,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon-home.png',
                  width: 25,
                  color: orangeColor,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon-report.png',
                  width: 25,
                ),
                label: 'Report'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon-history.png',
                  width: 25,
                ),
                label: 'History'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icon-profile.png',
                  width: 25,
                ),
                label: 'Profile'),
          ]),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, '/profile');
        },
        backgroundColor: orangeColor,
        shape: const CircleBorder(),
        child: Image.asset(
          'assets/icon-qr.png',
          width: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
