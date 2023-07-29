import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/landing_view/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:flutter_svg/svg.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  List<String> titleList = [
    'Find Food You Love',
    'Fast Delivery',
    'Live Tracking'
  ];
  List<String> descriptionList = [
    'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
    'Fast food delivery to your home, office \n wherever you are',
    'Real time tracking of your food on the app \n once you placed the order,'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/intro$currentIndex.svg'),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenHeight(40)),
            child: DotsIndicator(
              dotsCount: 3,
              position: currentIndex.toDouble(),
              decorator: const DotsDecorator(
                color: AppColors.gray300, // Inactive color
                activeColor: AppColors.orange400,
              ),
            ),
          ),
          Text(titleList[currentIndex]),
          Text(
            descriptionList[currentIndex],
            textAlign: TextAlign.center,
          ),
          CustomButton(
            margin: EdgeInsets.symmetric(
                vertical: ScreenHeight(20), horizontal: ScreenWidth(15)),
            title: currentIndex != 2 ? 'Next' : 'Finish',
            onpressd: () {
              if (currentIndex != 2) {
                setState(() {
                  currentIndex += 1;
                });
              } else
                // ignore: curly_braces_in_flow_control_structures
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return const LandingView();
                  },
                ));
            },
          ),
        ],
      ),
    ));
  }
}
