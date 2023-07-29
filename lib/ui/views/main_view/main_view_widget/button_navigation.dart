import 'package:easy_shopping/core/data/enums/button_navigation_enum.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  final ButtonNavigationEnum buttonNavigationEnum;
  final Function(ButtonNavigationEnum, int) onTap;

  BottomNavigationWidget(
      {Key? key, required this.onTap, required this.buttonNavigationEnum})
      : super(key: key);

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter: _ClipShadowShadowPainter(
            clipper: BottomNavigationClipper(),
            shadow: const Shadow(blurRadius: 20, color: AppColors.gray400),
          ),
          child: ClipPath(
            clipper: BottomNavigationClipper(),
            child: Container(
              width: size.width,
              height: size.width * 0.2,
              color: AppColors.white,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: size.width * 0.09),
          child: InkWell(
            onTap: () {
              widget.onTap(ButtonNavigationEnum.HOME, 2);
            },
            child: CircleAvatar(
              backgroundColor:
                  widget.buttonNavigationEnum == ButtonNavigationEnum.HOME
                      ? AppColors.orange400
                      : AppColors.gray400,
              child: SvgPicture.asset(
                'assets/images/ic_home.svg',
                color: AppColors.white,
              ),
              radius: size.width * 0.1,
            ),
          ),
        ),
        Positioned(
          ///?icons center/////
          bottom: ScreenWidth(25),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                  imageName: 'assets/images/ic_menu.svg',
                  text: 'Menu',
                  isSelected:
                      widget.buttonNavigationEnum == ButtonNavigationEnum.MENU,
                  onTap: () {
                    widget.onTap(ButtonNavigationEnum.MENU, 0);
                  },
                  size: size),
              SizedBox(
                width: ScreenWidth(20),
              ),
              navItem(
                  imageName: 'assets/images/ic_shopping.svg',
                  text: 'Offers',
                  isSelected: widget.buttonNavigationEnum ==
                      ButtonNavigationEnum.OFFERS,
                  onTap: () {
                    widget.onTap(ButtonNavigationEnum.OFFERS, 1);
                  },
                  size: size),
              SizedBox(
                width: ScreenWidth(3),
              ),
              navItem(
                  imageName: 'assets/images/ic_user.svg',
                  text: 'Profile',
                  isSelected: widget.buttonNavigationEnum ==
                      ButtonNavigationEnum.PROFILE,
                  onTap: () {
                    widget.onTap(ButtonNavigationEnum.PROFILE, 3);
                  },
                  size: size),
              SizedBox(
                width: ScreenWidth(20),
              ),
              navItem(
                  imageName: 'assets/images/ic_more.svg',
                  text: 'More',
                  isSelected:
                      widget.buttonNavigationEnum == ButtonNavigationEnum.MORE,
                  onTap: () {
                    widget.onTap(ButtonNavigationEnum.MORE, 4);
                  },
                  size: size),
            ],
          ),
        ),
      ],
    );
  }

  Widget navItem({
    required String imageName,
    required String text,
    required bool isSelected,
    required Function onTap,
    required Size size,
  }) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.asset(imageName,
              color: isSelected ? AppColors.orange400 : AppColors.gray400,
              width: ScreenWidth(35),
              height: ScreenHeight(35)),
          SizedBox(
            height: ScreenHeight(80),
          ),
          Text(
            text,
            style: TextStyle(
                color: isSelected ? AppColors.orange400 : AppColors.gray400,
                fontSize: 12),
          )
        ],
      ),
    );
  }
}

class BottomNavigationClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(size.width * 0.3, 0);
    path0.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path0.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path0.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path0.lineTo(size.width, 0);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

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

// class BottomNavigationPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = AppColors.textwhite
//       ..style = PaintingStyle.fill;
//     Path path = Path()..moveTo(0, 0);
//     path.quadraticBezierTo(size.width * 0.30, 0, size.width * 0.33, 0);
//     path.quadraticBezierTo(size.width * 0.37, 0, size.width * 0.37, 20);
//     path.arcToPoint(Offset(size.width * 0.63, 10),
//         radius: Radius.circular(20.0), clockwise: false);
//     path.quadraticBezierTo(size.width * 0.62, 0, size.width * 0.75, 0);
//     path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     // path.lineTo(0, 20);
//     path.close();
//     canvas.drawShadow(path, AppColors.textblackColor, 50, true);
//     canvas.drawPath(path, paint);

//     // TODO: implement paint
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
