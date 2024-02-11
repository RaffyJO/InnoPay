import 'package:flutter/material.dart';
import 'package:innopay/shared/theme.dart';
import 'package:innopay/view/pages/history/history_page.dart';
import 'package:innopay/view/pages/home/home_page.dart';
import 'package:innopay/view/pages/profile/profile_page.dart';
import 'package:innopay/view/pages/report/report_page.dart';
import 'package:innopay/view/widgets/bottom_nav_bar.dart';
import 'package:innopay/view/widgets/bottom_nav_bar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              HomePage(),
              ReportPage(),
              HistoryPage(),
              ProfilePage()
            ],
          ),
          BottomNavBar(
              items: [
                BottomNavBarItem(
                    index: 0,
                    isSelected: selectedPage == 0,
                    title: 'Home',
                    icon: Icon(
                      Icons.home,
                      color: greyColor,
                    ),
                    selectedIcon: Icon(
                      Icons.home,
                      color: orangeColor,
                    )),
                BottomNavBarItem(
                    index: 1,
                    isSelected: selectedPage == 1,
                    title: 'Report',
                    icon: Icon(
                      Icons.inbox,
                      color: greyColor,
                    ),
                    selectedIcon: Icon(
                      Icons.inbox,
                      color: orangeColor,
                    )),
                BottomNavBarItem(
                    index: 2,
                    isSelected: selectedPage == 2,
                    title: 'History',
                    icon: Icon(
                      Icons.history,
                      color: greyColor,
                    ),
                    selectedIcon: Icon(
                      Icons.history,
                      color: orangeColor,
                    )),
                BottomNavBarItem(
                    index: 3,
                    isSelected: selectedPage == 3,
                    title: 'Profile',
                    icon: Icon(
                      Icons.person,
                      color: greyColor,
                    ),
                    selectedIcon: Icon(
                      Icons.person,
                      color: orangeColor,
                    )),
              ],
              onTap: (index) {
                selectedPage = index;

                pageController.animateToPage(selectedPage,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut);
              },
              selectedIndex: 0)
        ],
      ),
    );
  }
}
