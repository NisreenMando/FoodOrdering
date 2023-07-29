// import 'package:easy_shopping/ui/shared/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// class CustomButton extends StatefulWidget {
//   const CustomButton(
//       {Key? key,
//       this.onPressed,
//       this.backgroundColor,
//       this.text,
//       this.textColor,
//       this.borderColor,
//       this.imageName,
//       this.height,
//       this.width,
//       this.icon,
//       this.fontWeight,
//       this.fontsize,
//       this.border,
//       this.maxLength,
//       this.overflow,
//       this.size,
//       this.color,
//       this.padding,
//       this.borderRadius,
//       this.fixedSize,
//       this.shape,
//       this.elevation,
//       this.child,
//       this.textAlign})
//       : super(key: key);

//   final Function? onPressed;
//   final Color? backgroundColor;
//   final String? text;
//   final String? imageName;
//   final Color? textColor;
//   final Color? borderColor;
//   final double? height;
//   final IconData? icon;
//   final double? width;
//   final double? fontsize;
//   final FontWeight? fontWeight;
//   final BoxBorder? border;
//   final double? size;
//   final int? maxLength;
//   final TextOverflow? overflow;
//   final Color? color;
//   final EdgeInsetsGeometry? padding;
//   final BorderRadiusGeometry? borderRadius;
//   final Size? fixedSize;
//   final OutlinedBorder? shape;
//   final double? elevation;
//   final Widget? child;
//   final TextAlign? textAlign;

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return ElevatedButton(
//       onPressed: () {
//         if (widget.onPressed != null) widget.onPressed!();
//       },
//       // ignore: sort_child_properties_last
//       child: widget.child ??
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               if (widget.imageName != null) ...[
//                 SvgPicture.asset('images/${widget.imageName}.svg'),
//                 //!      widget.sizedBox!
//               ],
//               Text(
//                 widget.text ?? '',
//                 textAlign: TextAlign.start,
//                 style: TextStyle(
//                   overflow: widget.overflow,
//                   color: widget.textColor,
//                   fontSize: widget.fontsize,
//                   fontWeight: widget.fontWeight,
//                 ),
//                 maxLines: widget.maxLength,
//               ),
//               const Spacer(),
//               Icon(
//                 widget.icon,
//                 size: widget.size,
//                 color: widget.color ?? Colors.pink,
//               )
//             ],
//           ),
//       style: ElevatedButton.styleFrom(
//         padding: widget.padding,
//         elevation: widget.elevation ?? 0,
//         fixedSize: widget.fixedSize ?? Size(size.width, size.width * 0.13),
//         shape: widget.shape ?? const StadiumBorder(),
//         backgroundColor: widget.backgroundColor ?? AppColors.primary,
//         side: widget.borderColor != null
//             ? BorderSide(
//                 width: widget.width ?? 1.0,
//                 color: widget.borderColor!,
//               )
//             : null,
//       ),
//     );
//   }
// }
//import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';


// cresate 2 home//

class CustomButton extends StatefulWidget {
  final EdgeInsets? margin;
  final Color? backgroundColor;
  final String? title;
  final Color? textColor;
  final VoidCallback? onpressd;
  final Color? borderColor;
  final IconData? icon;
  final double? height;
  final TextAlign? textAlign;
  final double? fontsize;
  final FontWeight? fontWeight;
  final Image? image;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final String? subTitle;
  final BorderRadiusGeometry? borderRadius;

  const CustomButton(
      {Key? key,
      this.margin,
      this.backgroundColor,
      this.title,
      this.textColor,
      this.onpressd,
      this.borderColor,
      this.icon,
      this.fontsize,
      this.fontWeight,
      this.height,
      this.textAlign,
      this.image,
      this.width,
      this.padding,
      this.child,
      this.subTitle,
      this.borderRadius})
      : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: widget.padding ??
            const EdgeInsets.symmetric(
              horizontal: 0,
            ),
        margin: widget.margin ??
            const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          borderRadius: widget.borderRadius,
          border:
              Border.all(color: widget.borderColor ?? AppColors.transparent),
          color: widget.backgroundColor ?? const Color(0xffFC6011),
        ),
        child: MaterialButton(
            onPressed: widget.onpressd ?? () {},
            child: widget.child ??
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.image ?? const SizedBox(),
                    // SizedBox(width: size.width / 20), //اختبار الصورة //
                    widget.icon != null
                        ? Row(
                            children: [
                              Icon(
                                widget.icon,
                                color: AppColors.white,
                                size: 30,
                              ),
                              // SizedBox(
                              //   width: size.width / 20,
                              // ),
                            ],
                          )
                        : const SizedBox(),
                    Row(
                      children: [
                        Text(
                          textAlign: widget.textAlign,
                          widget.title ?? '',
                          style: TextStyle(
                            height: widget.height,
                            fontWeight: widget.fontWeight,
                            fontSize: widget.fontsize,
                            color: widget.textColor ?? Colors.white,
                          ),
                        ),
                        Text(widget.subTitle ?? '')
                      ],
                    ),
                  ],
                )));
  }
}
