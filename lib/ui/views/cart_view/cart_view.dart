import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/cart_view/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:get/get.dart';

class CartView extends StatefulWidget {
  CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        return ListView.separated(
          shrinkWrap: true,
          itemCount: controller.cartList.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.cartList[index].meal!.name ?? '',
                      style: TextStyle(fontSize: ScreenWidth(10)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller
                              .removeFromCartList(controller.cartList[index]);
                        },
                        icon: Icon(Icons.delete))
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                      title: '+',
                      onpressd: () {
                        controller.changeCount(
                            true, controller.cartList[index]);
                      },
                    ),
                    Text(controller.cartList[index].count.toString(),
                        style: TextStyle(fontSize: ScreenWidth(10))),
                    CustomButton(
                      title: '-',
                      onpressd: () {
                        controller.changeCount(
                            false, controller.cartList[index]);
                      },
                    ),
                  ],
                ),
                Text(controller.cartList[index].total.toString(),
                    style: TextStyle(fontSize: ScreenWidth(10))),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              color: AppColors.orange400,
              width: ScreenWidth(30),
              height: 2,
            );
          },
        );
      })),
    );
  }
}
