import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:innopay/shared/theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Manage all your money\nin a single place',
    'Pay your various bills fast\nand without hassle',
    'Now, money transfer made easy\nwithout carrying cash'
  ];
  List<String> subTitles = [
    'With all your money, saving and managing\nit is easy in one place.',
    'Enjoy the convenience of managing all\nyour payments in one application.',
    'Transfer money to friends, family or business\npartners with just a few taps of your finger.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 24,
              ),
              CarouselSlider(
                items: [
                  Image.asset('assets/img_onboarding1.png'),
                  Image.asset('assets/img_onboarding2.png'),
                  Image.asset('assets/img_onboarding3.png')
                ],
                options: CarouselOptions(
                  height: 280,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                carouselController: carouselController,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        subTitles[currentIndex],
                        style: greyTextStyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: (currentIndex == 0) ? 24 : 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (currentIndex == 0)
                                    ? orangeColor
                                    : greyColor),
                          ),
                          Container(
                            width: (currentIndex == 1) ? 24 : 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (currentIndex == 1)
                                    ? orangeColor
                                    : greyColor),
                          ),
                          Container(
                            width: (currentIndex == 2) ? 24 : 10,
                            height: 10,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: (currentIndex == 2)
                                    ? orangeColor
                                    : greyColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      (currentIndex == 2)
                          ? SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/register', (route) => false);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: whiteColor,
                                      backgroundColor: orangeColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    'Get Started',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold),
                                  )),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    carouselController.nextPage();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: whiteColor,
                                      backgroundColor: orangeColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text(
                                    'Continue',
                                    style: whiteTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold),
                                  )),
                            ),
                      const SizedBox(
                        height: 8,
                      ),
                      (currentIndex == 2)
                          ? SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, '/login', (route) => false);
                                  },
                                  child: Text(
                                    'Sign In',
                                    style: orangeTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold),
                                  )),
                            )
                          : SizedBox(
                              width: double.infinity,
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      carouselController.animateToPage(2);
                                    });
                                  },
                                  child: Text(
                                    'Skip',
                                    style: orangeTextStyle.copyWith(
                                        fontSize: 14, fontWeight: semiBold),
                                  )),
                            )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
