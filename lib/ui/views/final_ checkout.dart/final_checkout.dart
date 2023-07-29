import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:easy_shopping/ui/views/my_order.dart/my_order.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class FinalCheckout extends StatefulWidget {
  const FinalCheckout({Key? key}) : super(key: key);

  @override
  State<FinalCheckout> createState() => _FinalCheckoutState();
}

class _FinalCheckoutState extends State<FinalCheckout> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.black.withOpacity(0.60),
        body: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.only(top: size.height / 4),
          decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height / 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.gray400,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Image.asset('assets/images/monkey_face.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    tr('thank'),
                    style: const TextStyle(
                        color: AppColors.gray400,
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  tr('for'),
                  style: const TextStyle(
                      color: AppColors.gray400,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 17, vertical: size.height / 20),
                  child: Text(
                    tr('yourO'),
                    style: const TextStyle(
                      color: AppColors.gray400,
                      fontSize: 13,
                    ),
                  ),
                ),
                CustomButton(
                  title: tr('track'),
                  backgroundColor: AppColors.orange,
                  textColor: AppColors.white,
                  onpressd: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyOrder()),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeView(
                                onMenuTap: () {},
                              )),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height / 20),
                    child: Text(
                      tr('back'),
                      style: const TextStyle(
                          color: AppColors.gray400,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
