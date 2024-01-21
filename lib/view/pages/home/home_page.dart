import 'package:flutter/material.dart';
import 'package:innopay/shared/methods.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/home/methods/user_balance.dart';
import 'package:innopay/view/pages/home/methods/user_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: orangeColor,
      body: ListView(
        padding:
            EdgeInsets.only(top: statusBarHeight + 24, left: 24, right: 24),
        children: [
          Column(
            children: [
              userInfo(),
              verticalSpace(30),
              const UserBalanceWidget()
            ],
          ),
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
        onPressed: () {},
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
