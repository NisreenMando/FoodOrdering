import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/landing_view/landing_view_controller.dart';
import 'package:easy_shopping/ui/views/login.dart/login_view.dart';
import 'package:easy_shopping/ui/views/map_view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
// import 'package:flutter_svg/svg.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  @override
  void initState() {
    super.initState();
  }

  final controller = Get.put(landingViewController());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              CustomPaint(
                painter: _ClipShadowPainter(
                  clipper: LandingClipper(),
                  shadow: const Shadow(blurRadius: 12),
                ),
                child: ClipPath(
                  clipper: LandingClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.45,
                    alignment: Alignment.bottomCenter,
                    // ignore: sort_child_properties_last
                    child: Image.asset(
                      'assets/images/shaped.png',
                      fit: BoxFit.fitWidth,
                      width: size.width,
                    ),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(252, 96, 17, 1)),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.35),
                  child: Image.asset(
                    'assets/images/monkey_face.png',
                    width: size.width / 4.5,
                    height: size.width / 4.5,
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Meal',
                style: TextStyle(
                    fontSize: 35,
                    color: AppColors.orange400,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Monky',
                style: TextStyle(
                    fontSize: 35,
                    color: AppColors.gray700,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text(
            'FOOD DELIVERY',
            style: TextStyle(
              color: AppColors.gray700,
              fontSize: 10,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.width * 0.15),
            child: Text(
              'Discover the best foods from over 1,000 \n restaurants and fast delivery to your doorstep',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.black, fontSize: size.width * 0.04),
            ),
          ),
          Column(children: [
            CustomButton(
              title: 'Login',
              onpressd: () async {
                LocationData? currentLocation =
                    await locationService.getUserCurrentLocation();
                if (currentLocation != null)
                  Get.to(
                    () => MapView(currentLocation: currentLocation),
                  );

                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) {
                //     return const LoginView();
                //   },
                // ));
              },
            ),
            Obx(() {
              return CustomButton(
                backgroundColor: controller.buttonColor.value,
              );
            }),
            SizedBox(
              height: size.width * 0.05,
            ),
            const CustomButton(
              title: 'Create an Account',
              textColor: AppColors.orange400,
              backgroundColor: AppColors.white,
              borderColor: AppColors.orange400,
            ),
          ]),
        ],
      ),
    )));
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.0008333, size.height * 0.0014286);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width, size.height * 0.6964286, size.width,
        size.height * 0.9285714);
    path0.quadraticBezierTo(size.width * 0.9968083, size.height * 1.0063571,
        size.width * 0.9591667, size.height);
    path0.lineTo(size.width * 0.6664500, size.height);
    path0.quadraticBezierTo(size.width * 0.6596000, size.height * 0.7251000,
        size.width * 0.5001750, size.height * 0.7281714);
    path0.quadraticBezierTo(size.width * 0.3309417, size.height * 0.7312429,
        size.width * 0.3327583, size.height);
    path0.lineTo(size.width * 0.0460500, size.height);
    path0.quadraticBezierTo(size.width * 0.0006667, size.height * 1.0078714, 0,
        size.height * 0.9271429);
    path0.quadraticBezierTo(size.width * 0.0002083, size.height * 0.6957143,
        size.width * 0.0008333, size.height * 0.0014286);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
