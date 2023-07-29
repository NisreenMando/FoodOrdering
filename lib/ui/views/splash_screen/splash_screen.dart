import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/splash_screen/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/images/bg_background.svg',
            fit: BoxFit.fill,
          ),
          Center(
            child: SvgPicture.asset(
              'assets/images/Logo.svg',
            ),
          ),
       
          Positioned(
              bottom: ScreenHeight(75),
              child: const SpinKitThreeBounce(color: AppColors.orange400)),
        ],
      ),
    ));
  }
}