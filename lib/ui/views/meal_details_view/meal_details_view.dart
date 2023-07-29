// import 'package:easy_shopping/core/data/models/api/meal_model.dart';
// import 'package:easy_shopping/ui/shared/colors.dart';
// import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
// import 'package:easy_shopping/ui/shared/utils.dart';
// import 'package:easy_shopping/ui/views/meal_details_view/meal_details_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MealDetailsView extends StatefulWidget {
//   final MealModel model;
//   MealDetailsView({Key? key, required this.model}) : super(key: key);

//   @override
//   State<MealDetailsView> createState() => _MealDetailsViewState();
// }

// class _MealDetailsViewState extends State<MealDetailsView> {
//   late MealDetailsController controller;
//   @override
//   void initState() {
//     controller = Get.put(MealDetailsController(widget.model));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: Expanded(
//         child: ListView(
//           children: [
//             Text(
//               'Price: ${widget.model.price}',
//               style: TextStyle(fontSize: ScreenWidth(10)),
//             ),
//             Obx(() {
//               return Row(
//                 children: [
//                   CustomButton(
//                     title: '+',
//                     onpressd: () {
//                       controller.changeCount(true);
//                     },
//                   ),
//                   CustomButton(title: controller.count.value.toString()),
//                   CustomButton(
//                     title: '-',
//                     onpressd: controller.count.value == 1
//                         ? null
//                         : () {
//                             controller.changeCount(false);
//                           },
//                     backgroundColor: controller.count.value == 1
//                         ? AppColors.gray400
//                         : AppColors.orange400,
//                   ),
//                 ],
//               );
//             }),
//             Obx(() {
//               return Text(
//                 controller.calcTotal().toString(),
//                 style: TextStyle(fontSize: ScreenWidth(10)),
//               );
//             }),
//             CustomButton(
//               title: 'add',
//               onpressd: () {
//                 controller.addToCart();
//               },
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/meal_details_view/meal_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MealDetailsView extends StatefulWidget {
  final MealModel model;
  const MealDetailsView({Key? key, required this.model}) : super(key: key);

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  double rating = 0;
  int i = 0;
  final panelcontroller = PanelController();
  String? dropdownvalue;
  var images = [
    'big size',
    'medium size',
    'small size',
  ];
  String? dropdownvalue2;
  var ingredients = [
    'mozzarella cheese',
    'mushroom',
    'corn',
  ];
  @override
  late MealDetailsController controller;
  void initState() {
    controller = Get.put(MealDetailsController(widget.model));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      //             SlidingUpPanel(
      //               maxHeight: size.height / 1.65,
      //               minHeight: size.width / 1,
      //               controller: PanelController(),
      //               parallaxEnabled: true,
      //               backdropEnabled: true,
      //               body: _photos(),
      //               panelBuilder: (sc) => _flower(sc),
      //               borderRadius: const BorderRadius.only(
      //                   topLeft: Radius.circular(35),
      //                   topRight: Radius.circular(35)),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.symmetric(
      //             horizontal: size.width / 15, vertical: size.height / 13),
      //         child: Row(
      //           children: [
      //             IconButton(
      //               onPressed: () {
      //                 Navigator.of(context).pop();
      //               },
      //               icon: const Icon(
      //                 Icons.arrow_back_ios,
      //               ),
      //               color: AppColors.white,
      //               iconSize: 25,
      //             ),
      //             const Spacer(),
      //             Image.asset(
      //               'assets/images/shopping.png',
      //               color: AppColors.white,
      //             )
      //           ],
      //         ),
      //       ),
      //       Positioned(
      //         top: size.height / 2.5,
      //         child: Padding(
      //           padding: EdgeInsetsDirectional.only(start: size.width / 1.3),
      //           child: Container(
      //             width: size.width / 7,
      //             height: size.height / 12.5,
      //             decoration: BoxDecoration(
      //               color: AppColors.white,
      //               borderRadius: BorderRadius.circular(25),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: AppColors.gray600.withOpacity(0.5),
      //                   spreadRadius: 2,
      //                   blurRadius: 10,
      //                   offset: const Offset(0, 3), // changes position of shadow
      //                 ),
      //               ],
      //             ),
      //             child: Image.asset(
      //               'assets/images/heart.png',
      //             ),
      //           ),
      //         ),
      //       ),
      //     ]),
      //   ));
      // }

      // Widget _photos() {
      //   final size = MediaQuery.of(context).size;
      //   return Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       SizedBox(
      //         width: size.width / 1,
      //         height: size.height / 1.20,
      //         child: Image.asset(
      //           'assets/images/pizza.png',
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ],
      //   );
      // }

      // Widget _flower(ScrollController sc) {
      //   final size = MediaQuery.of(context).size;
      //   return Stack(children: [
      //     Container(
      //         width: size.width / 1,
      //         height: size.height / 1,
      //         decoration: const BoxDecoration(
      //             color: AppColors.transparent,
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      //         child: SingleChildScrollView(
      //           child: Padding(
      //               padding: EdgeInsets.only(top: size.height / 15),
      //               child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   mainAxisAlignment: MainAxisAlignment.start,
      //                   children: [
      //                     Padding(
      //                       padding:
      //                           EdgeInsets.symmetric(horizontal: size.width / 40),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         mainAxisAlignment: MainAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             tr('tandoori_chicken _pizaa'),
      //                             style: const TextStyle(
      //                               color: AppColors.gray600,
      //                               fontSize: 18,
      //                             ),
      //                           ),
      //                           Row(children: [
      //                             RatingBar.builder(
      //                               minRating: 1,
      //                               itemSize: 25,
      //                               itemPadding: const EdgeInsets.all(2),
      //                               itemBuilder: (context, _) => Icon(
      //                                 Icons.star,
      //                                 size: double.tryParse('1.1'),
      //                                 color: AppColors.orange,
      //                               ),
      //                               onRatingUpdate: (rating) => setState(() {
      //                                 this.rating = rating;
      //                               }),
      //                             ),
      //                           ]),
      //                           Row(
      //                             children: [
      //                               Padding(
      //                                 padding: EdgeInsets.only(
      //                                     left: size.width / 30,
      //                                     bottom: size.height / 20),
      //                                 child: Row(
      //                                   children: [
      //                                     Text(
      //                                       tr('Star_rating'),
      //                                       style: const TextStyle(
      //                                           fontSize: 11,
      //                                           color: AppColors.orange),
      //                                     ),
      //                                     Text(
      //                                       '$rating',
      //                                       style: const TextStyle(
      //                                           color: AppColors.orange),
      //                                     )
      //                                   ],
      //                                 ),
      //                               ),
      //                               Row(
      //                                 children: [
      //                                   Padding(
      //                                     padding: EdgeInsetsDirectional.only(
      //                                         start: size.width / 3.5),
      //                                     child: Column(
      //                                       children: [
      //                                         Text(
      //                                           tr('rs'),
      //                                           style: const TextStyle(
      //                                               color: AppColors.gray600,
      //                                               fontSize: 25,
      //                                               fontWeight: FontWeight.bold),
      //                                         ),
      //                                         Text(
      //                                           tr('per'),
      //                                           style: const TextStyle(
      //                                               color: AppColors.gray600),
      //                                         )
      //                                       ],
      //                                     ),
      //                                   ),
      //                                 ],
      //                               )
      //                             ],
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: size.width / 30,
      //                                 vertical: size.height / 50),
      //                             child: Text(
      //                               tr('description'),
      //                               style: const TextStyle(
      //                                   color: AppColors.gray600,
      //                                   fontSize: 16,
      //                                   fontWeight: FontWeight.bold),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: size.width / 30,
      //                                 vertical: size.height / 50),
      //                             child: Text(
      //                               tr('lorem'),
      //                               style: const TextStyle(
      //                                 color: AppColors.gray600,
      //                                 fontSize: 12,
      //                               ),
      //                               maxLines: 3,
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding:
      //                                 const EdgeInsets.symmetric(horizontal: 10),
      //                             child: Container(
      //                               width: size.width / 1,
      //                               height: 1,
      //                               decoration: const BoxDecoration(
      //                                   color: AppColors.gray600),
      //                             ),
      //                           ),
      //                           Padding(
      //                             padding: EdgeInsets.symmetric(
      //                                 horizontal: size.width / 30,
      //                                 vertical: size.height / 40),
      //                             child: Text(
      //                               tr('customiz_your_order'),
      //                               style: const TextStyle(
      //                                   color: AppColors.gray600,
      //                                   fontSize: 15,
      //                                   fontWeight: FontWeight.bold),
      //                             ),
      //                           ),
      //                           Container(
      //                             width: size.width / 1,
      //                             height: size.height / 12,
      //                             margin: const EdgeInsets.symmetric(
      //                                 vertical: 10, horizontal: 7),
      //                             decoration:
      //                                 const BoxDecoration(color: AppColors.gray200),
      //                             child: DropdownButton(
      //                               underline: Container(),
      //                               value: dropdownvalue,
      //                               hint: Text(
      //                                 tr('select'),
      //                                 style: const TextStyle(
      //                                   color: AppColors.gray600,
      //                                   fontSize: 14,
      //                                 ),
      //                               ),
      //                               icon: Padding(
      //                                 padding: EdgeInsetsDirectional.only(
      //                                   start: size.width / 5,
      //                                 ),
      //                                 child: const Icon(
      //                                   Icons.keyboard_arrow_down,
      //                                   size: 33,
      //                                 ),
      //                               ),
      //                               items: images.map((String images) {
      //                                 return DropdownMenuItem(
      //                                   value: images,
      //                                   child: Text(images),
      //                                 );
      //                               }).toList(),
      //                               onChanged: (String? newvalue) {
      //                                 setState(() {
      //                                   dropdownvalue = newvalue!;
      //                                 });
      //                               },
      //                             ),
      //                           ),
      //                           Container(
      //                             width: size.width / 1,
      //                             height: size.height / 12,
      //                             margin: EdgeInsets.symmetric(
      //                                 horizontal: size.width / 50, vertical: 10),
      //                             decoration:
      //                                 const BoxDecoration(color: AppColors.gray200),
      //                             child: DropdownButton(
      //                               underline: Container(),
      //                               value: dropdownvalue2,
      //                               hint: Text(
      //                                 tr('select_2'),
      //                                 style: const TextStyle(
      //                                   color: AppColors.gray600,
      //                                   fontSize: 14,
      //                                 ),
      //                               ),
      //                               icon: Padding(
      //                                 padding: EdgeInsetsDirectional.only(
      //                                   start: size.width / 3.7,
      //                                 ),
      //                                 child: const Icon(
      //                                   Icons.keyboard_arrow_down,
      //                                   size: 33,
      //                                 ),
      //                               ),
      //                               items: ingredients.map((String ingredients) {
      //                                 return DropdownMenuItem(
      //                                   value: ingredients,
      //                                   child: Text(ingredients),
      //                                 );
      //                               }).toList(),
      //                               onChanged: (String? newvalue) {
      //                                 setState(() {
      //                                   dropdownvalue2 = newvalue!;
      //                                 });
      //                               },
      //                             ),
      //                           ),
      // Row(
      //   children: [
      //     Padding(
      //       padding: EdgeInsets.symmetric(
      //           horizontal: size.width / 30,
      //           vertical: size.height / 20),
      //       child: Text(
      //         tr('number'),
      //         style: const TextStyle(
      //             color: AppColors.gray600,
      //             fontSize: 12,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Container(
      //       width: size.width / 7,
      //       height: size.height / 20,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         color: AppColors.orange,
      //       ),
      //       child: IconButton(
      //           onPressed: () {
      //             setState(() {
      //               if (i == 0) {
      //                 return;
      //               }
      //               i--;
      //             });
      //           },
      //           icon: const Icon(
      //             Icons.remove,
      //             color: AppColors.white,
      //             size: 15,
      //           )),
      //     ),
      //     Container(
      //       margin:
      //           const EdgeInsets.only(left: 7, right: 7),
      //       width: size.width / 7,
      //       height: size.height / 20,
      //       decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           border:
      //               Border.all(color: AppColors.orange)),
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(
      //             horizontal: 20, vertical: 5),
      //         child: Text(
      //           '$i',
      //           style: const TextStyle(
      //               color: AppColors.orange,
      //               fontSize: 12),
      //         ),
      //       ),
      //     ),
      //     Container(
      //       width: size.width / 7,
      //       height: size.height / 20,
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(20),
      //         color: AppColors.orange,
      //       ),
      //       child: IconButton(
      //           onPressed: () {
      //             setState(() {
      //               i++;
      //             });
      //           },
      //           icon: const Icon(
      //             Icons.add,
      //             color: AppColors.white,
      //             size: 15,
      //           )),
      //     ),
      //   ],
      // ),

      Obx(() {
        return Row(
          children: [
            CustomButton(
              title: '+',
              onpressd: () {
                controller.changeCount(true);
              },
            ),
            CustomButton(title: controller.count.value.toString()),
            CustomButton(
              title: '-',
              onpressd: controller.count.value == 1
                  ? null
                  : () {
                      controller.changeCount(false);
                    },
              backgroundColor: controller.count.value == 1
                  ? AppColors.gray400
                  : AppColors.orange400,
            ),
          ],
        );
      }),
      //     ],
      //   ),
      // ),
      // Stack(children: [
      //   Container(
      //     width: size.width / 2.8,
      //     height: size.height / 3,
      //     decoration: const BoxDecoration(
      //       color: AppColors.orange,
      //       borderRadius: BorderRadius.only(
      //           topRight: Radius.circular(50),
      //           bottomRight: Radius.circular(50)),
      //     ),
      //   ),
      //   Container(
      //     margin: EdgeInsetsDirectional.only(
      //         start: size.width / 5.5, top: size.height / 20),
      //     width: size.width / 1.4,
      //     height: size.height / 4.5,
      //     decoration: BoxDecoration(
      //       color: AppColors.white,
      //       borderRadius: const BorderRadius.only(
      //           topLeft: Radius.circular(40),
      //           bottomLeft: Radius.circular(40),
      //           topRight: Radius.circular(15),
      //           bottomRight: Radius.circular(15)),
      //       boxShadow: [
      //         BoxShadow(
      //           color: AppColors.gray600.withOpacity(0.4),
      //           spreadRadius: 3,
      //           blurRadius: 15,
      //           offset: const Offset(
      //               0, 3), // changes position of shadow
      //         ),
      //       ],
      //     ),
      //     child: Padding(
      //       padding: EdgeInsets.only(bottom: size.height / 20),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Text(
      //             tr('total'),
      //             style: const TextStyle(
      //                 color: AppColors.gray600, fontSize: 10),
      //           ),
      //           const SizedBox(
      //             height: 8,
      //           ),
      //           Text(tr('lkr'),
      //               style: const TextStyle(
      //                   color: AppColors.gray600,
      //                   fontSize: 19,
      //                   fontWeight: FontWeight.bold))
      //         ],
      //       ),
      //     ),
      //   ),
      //   Container(
      //     margin: EdgeInsetsDirectional.only(
      //         start: size.width / 1.2, top: size.height / 8),
      //     width: size.width / 9,
      //     height: size.height / 16,
      //     decoration: BoxDecoration(
      //       color: AppColors.white,
      //       borderRadius: BorderRadius.circular(25),
      //       boxShadow: [
      //         BoxShadow(
      //           color: AppColors.gray600.withOpacity(0.4),
      //           spreadRadius: 3,
      //           blurRadius: 15,
      //           offset: const Offset(
      //               0, 3), // changes position of shadow
      //         ),
      //       ],
      //     ),
      //     child: Image.asset(
      //       'assets/images/shopping.png',
      //       color: AppColors.orange,
      //     ),
      //   ),
      //   Container(
      //     margin: EdgeInsetsDirectional.only(
      //         top: size.height / 5, start: size.width / 3.2
      //         // left: size.width / 3.3,
      //         ),
      //     width: size.width / 2.2,
      //     height: size.height / 23,
      //     decoration: BoxDecoration(
      //         color: AppColors.orange,
      //         borderRadius: BorderRadius.circular(20)),
      //     child: Row(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Padding(
      //             padding: EdgeInsets.symmetric(
      //                 horizontal: size.width / 18, vertical: 5),
      //             child: Image.asset(
      //               'assets/images/shopping.png',
      //               color: AppColors.white,
      //               width: 15,
      //               height: 15,
      //             ),
      //           ),
      //           // SizedBox(
      //           //   width: size.width / 20,
      //           // ),
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Text(
          tr('addt'),
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 11,
              fontWeight: FontWeight.w300),
        ),
      )
    ]));
  }
}
