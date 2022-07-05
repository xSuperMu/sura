import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../themes/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_splash_page.dart';
import '../../widgets/custom_text.dart';
import 'home.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding>
    with SingleTickerProviderStateMixin {
  final controller = PageController(initialPage: 3);
  bool isLastPage = false;
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: white,
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 0);
          },
          children: [
            //page 1
            CustomPage(
                imgPath: 'assets/images/listMan.png',
                text: ' انجز اعمالك بأقصر وقت ممكن'),
            //page 2
            CustomPage(
              imgPath: 'assets/images/locMan.png',
              text:
                  ' قم بتحديد الأماكن التي تريد زيارتها\n و سرى يقدم لك الطريق الأمثل',
            ),
            //page 3
            CustomPage(
                imgPath: 'assets/images/deliveryMan.png',
                text: ' اختصر رحلتك و اجعلها مع سُرى'),
          ],
        ),
      ),
      bottomSheet: Container(
        color: white,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: size.height * 0.25,
        child: Column(
          children: [
            // dots effect
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                    activeDotColor: whiteBlue,
                    dotColor: babyBlue,
                    dotHeight: size.height * 0.017,
                    dotWidth: size.width * 0.075),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),
            //buttom row contain next and skip buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLastPage
                    ? CustomButton(
                        label: 'ابدأ',
                        hight: size.height * 0.05,
                        width: size.width * 0.3,
                        onPressed: () {
                          if (isLastPage == true) {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          }
                        },
                      )
                    : SizedBox(width: size.width * 0.3),
                SizedBox(width: size.width * 0.3),
                TextButton(
                    onPressed: () async {
                      // final prefs = await SharedPreferences.getInstance();
                      // prefs.setBool('showHome', true);
                    },
                    child: CustomText(
                      data: 'تخطي',
                      textColor: darkBlue,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
