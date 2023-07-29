import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:easy_shopping/core/utils/network_utils.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_text.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home_controller.dart';
import 'package:easy_shopping/ui/views/meal_details_view/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  final Function() onMenuTap;

  const HomeView({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // drawer: Container(
      //   color: AppColors.orange,
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenWidth(20), vertical: ScreenWidth(17)),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Obx(() {
              return Icon(
                controller.isOnlne.value ? Icons.wifi : Icons.wifi_off,
                color: controller.isOnlne.value ? Colors.green : Colors.orange,
                size: ScreenWidth(10),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                    text: tr('goodmorning'),
                    color: AppColors.gray600,
                    size: ScreenWidth(16),
                    fontWeight: FontWeight.w400),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColors.gray600,
                    )),
              ],
            ),
            SizedBox(height: ScreenHeight(50)),
            CustomText(
                text: 'deliveringto'.tr,
                color: AppColors.gray400,
                size: ScreenWidth(22),
                fontWeight: FontWeight.normal),
            SizedBox(height: ScreenWidth(70)),
            Row(
              children: [
                Text(
                  tr(
                    'current',
                  ),
                  style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.gray400,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.orange,
                  size: 25,
                ),
              ],
            ),
            Obx(() {
              return controller.isCategoryLoading
                  ? const SpinKitCircle(
                      color: AppColors.orange400,
                    )
                  : controller.categoryList.isEmpty
                      ? const Text('No Category')
                      : Container(
                          color: Colors.cyan.shade200,
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            addAutomaticKeepAlives: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  Text(
                                    controller.categoryList[index].name ?? '',
                                    style: const TextStyle(fontSize: 60),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                width: 100,
                                height: 5,
                                color: AppColors.orange400,
                              );
                            },
                          ),
                        );
            }),
            Obx(() {
              return controller.isCategoryLoading
                  ? const SpinKitCircle(
                      color: AppColors.orange400,
                    )
                  : controller.mealList.isEmpty
                      ? const Text('No Category')
                      : Container(
                          color: Colors.pink.shade200,
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.mealList.length,
                            addAutomaticKeepAlives: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await Get.to(MealDetailsView(
                                          model: controller.mealList[index]));
                                    },
                                    child: CachedNetworkImage(
                                      imageUrl: controller.mealList[index]
                                                  .images!.length >
                                              0
                                          ? getFullImageUrl(controller
                                              .mealList[index].images![0])
                                          : '',
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  Text(
                                    controller.mealList[index].name ?? '',
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return Container(
                                width: 100,
                                height: 5,
                                color: AppColors.orange400,
                              );
                            },
                          ),
                        );
            }),
          ]),
        ),
      ),
    ));
  }

  String getFullImageUrl(String url) {
    var splitedString = url.split('Images/');
    return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
  }
  //!list 1

  Widget services({String? iconpath, String? type, index}) {
    return Column(
      children: [
        CustomButton(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenWidth(20),
            ),
            width: ScreenWidth(15),
            height: ScreenWidth(25),
            backgroundColor: Colors.amber,
            child: controller.categoryList[index].meals != null
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: CachedNetworkImage(
                      imageUrl: getFullImageUrl(controller
                          .categoryList[index].meals![index].images![0]),
                      color: Colors.green,
                    ),
                  )
                : null),
        Text(
          controller.categoryList[index].name ?? '',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:dartz/dartz.dart' as dartz;
// import 'package:easy_shopping/ui/shared/colors.dart';
// import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
// import 'package:easy_shopping/ui/shared/utils.dart';
// import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home_controller.dart';
// import 'package:easy_shopping/ui/views/meal_details_view/meal_details_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// class HomeView extends StatefulWidget {
//   final Function onPressed;
//   HomeView({Key? key, required this.onPressed}) : super(key: key);

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   HomeController controller = Get.put(HomeController());

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//           drawer: Container(
//             color: AppColors.red,
//           ),
//           body: Column(
//             children: [
//               Obx(() {
//                 return controller.isCategoryLoading
//                     ? SpinKitCircle(
//                         color: AppColors.orange400,
//                       )
//                     : Expanded(
//                         child: controller.categoryList.isEmpty
//                             ? Text('No Category')
//                             : ListView.builder(
//                                 scrollDirection: Axis.horizontal,
//                                 shrinkWrap: true,
//                                 itemCount: controller.categoryList.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                     children: [
//                                       CachedNetworkImage(
//                                         imageUrl:
//                                             'http://via.placeholder.com/350x150',
//                                         placeholder: (context, url) =>
//                                             CircularProgressIndicator(),
//                                         errorWidget: (context, url, error) =>
//                                             Icon(Icons.error),
//                                       ),
//                                       Text(
//                                         controller.categoryList[index].name ??
//                                             '',
//                                         style: TextStyle(fontSize: 50),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                       );
//               }),
//               Obx(() {
//                 return controller.isMealLoadin
//                     ? SpinKitCircle(
//                         color: AppColors.orange400,
//                       )
//                     : Expanded(
//                         child: controller.mealList.isEmpty
//                             ? Text('No Meal')
//                             : ListView.builder(
//                                 scrollDirection: Axis.vertical,
//                                 shrinkWrap: true,
//                                 itemCount: controller.mealList.length,
//                                 itemBuilder: (BuildContext context, int index) {
//                                   return Column(
//                                     children: [
//                                       // InkWell(
//                                       //     onTap: () async {
//                                       //       await Get.to(MealDetailsView(
//                                       //           model: controller
//                                       //               .mealList[index]));
//                                       //     },
//                                       //     child: CachedNetworkImage(
//                                       //       imageUrl:
//                                       //           'http://via.placeholder.com/350x150',
//                                       //       placeholder: (context, url) =>
//                                       //           CircularProgressIndicator(),
//                                       //       errorWidget:
//                                       //           (context, url, error) =>
//                                       //               Icon(Icons.error),
//                                       //     )),
//                                       Row(
//                                         children: [
//                                           Text(
//                                             controller.mealList[index].name ??
//                                                 '',
//                                             style: TextStyle(fontSize: 50),
//                                           ),
//                                           CustomButton(
//                                             title: '+',
//                                             width: ScreenWidth(10),
//                                             onpressd: () {
//                                               controller.addToCart(
//                                                   controller.mealList[index]);
//                                             },
//                                           ),
//                                           Obx(() {
//                                             print(
//                                                 controller.categoryList.length);
//                                             return CustomButton(
//                                               title: '${cartService.cartCount}',
//                                               width: ScreenWidth(10),
//                                               onpressd: () {},
//                                             );
//                                           })
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                       );
//               })
//             ],
//           )),
//     );
//   }
// }
