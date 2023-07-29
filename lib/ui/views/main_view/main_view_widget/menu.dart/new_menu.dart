import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/data/models/api/model_menu.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/views/beverages.dart/beverages.dart';
import 'package:easy_shopping/ui/views/desserts.dart/dessrts.dart';
import 'package:easy_shopping/ui/views/food.dart/food.dart';
import 'package:easy_shopping/ui/views/meal_details_view/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class MenuView extends StatefulWidget {
  MealModel mealModel=MealModel();
   MenuView({ Key? key,required this.mealModel}) : super(key: key,);

  @override
  State<MenuView> createState() => _MenuView();
}

class _MenuView extends State<MenuView> {
  final searchcontrolle = TextEditingController();

  int first = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        // bottomNavigationBar: const CustomNavigator(
        //   index: 0,
        // ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 13,
                      right: size.width / 15,
                      left: size.width / 15),
                  child: Row(
                    children: [
                      Text(
                        tr('menu'),
                        style: const TextStyle(
                            color: AppColors.gray600, fontSize: 24),
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/shopping.png',
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height / 15,
                    horizontal: size.width / 20,
                  ),
                  child: CustomTextFormField(
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: searchcontrolle,
                      labeltext: tr('search_food'),
                      icon: const Icon(Icons.search, color: AppColors.gray400),
                      borderRaduis: 35),
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height / 1.13,
                          width: size.width / 3.3,
                          decoration: const BoxDecoration(
                              color: AppColors.orange,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              )),
                        ),
                      ],
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: MenuFood.foods.length,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        itemBuilder: (context, index) {
                          return eat(
                            id: MenuFood.foods[index].id,
                            iconpath: MenuFood.foods[index].iconpath,
                            typefood: MenuFood.foods[index].typefood,
                            itemsfood: MenuFood.foods[index].itemsfood,
                          );
                        }),
                  ],
                ),
                SizedBox(
                  height: size.height / 50,
                )
              ]),
        )));
  }

  Widget eat({String? iconpath, String? typefood, String? itemsfood, int? id}) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
        width: size.width / 1,
        height: size.height / 7,
        decoration: const BoxDecoration(
          color: AppColors.transparent,
        ),
      ),
      Center(
          child: InkWell(
        onTap: () {
          if (id == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Food()));
          } else if (id == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BeveRages()));
            return;

            ///
          } else if (id == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Desserts()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsView(model: MealModel())));
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: size.width / 10, top: 28),
          width: size.width / 1.4,
          height: size.height / 6.5,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray100.withOpacity(0.3),
                  offset: const Offset(0, 3),
                  spreadRadius: 5,
                  blurRadius: 7,
                )
              ],
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40)),
              color: AppColors.white),
        ),
      )),
      InkWell(
        onTap: () {
          if (id == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const Food()));
          } else if (id == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const BeveRages()));
            return;
          } else if (id == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Desserts()));
          } else {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MealDetailsView(
                          model: MealModel(
                            id:widget.mealModel.id ,images:widget.mealModel.images ,
                            categoryName:widget.mealModel.categoryName ,
                            categoryId: widget.mealModel.categoryId,price: widget.mealModel.categoryId,
                            name: widget.mealModel.name,description: widget.mealModel.description),
                        )));
          }
        },
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: size.width / 20, top: size.height / 17),
          child: Row(
            children: [
              getImageShape(id!),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        typefood!,
                        style: const TextStyle(
                            color: AppColors.gray600,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        itemsfood!,
                        style: const TextStyle(
                            color: AppColors.gray400, fontSize: 11),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        top: 55,
        left: 50,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
              start: size.width / 1.4, end: size.width / 5),
          child: Container(
            width: size.width / 9,
            height: size.height / 16,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: AppColors.gray200.withOpacity(0.3),
                offset: const Offset(0, 1),
                spreadRadius: 4,
                blurRadius: 7,
              )
            ], color: AppColors.white, borderRadius: BorderRadius.circular(25)),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 5, end: 5),
              child: IconButton(
                icon: const Center(
                    child: Icon(
                  Icons.arrow_forward_ios,
                )),
                color: AppColors.orange,
                iconSize: 18,
                onPressed: () {
                  if (id == 0) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Food()));
                  } else if (id == 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BeveRages()));
                    return;
                  } else if (id == 2) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Desserts()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MealDetailsView(
                                  model: MealModel(
                                    id:widget.mealModel.id ,
                                    images: widget.mealModel.images,
                                    name:widget.mealModel.name ,
                                    categoryId:widget.mealModel.categoryId ,
                                    price: widget.mealModel.price,
                                    description: widget.mealModel.description,
                                    categoryName:widget.mealModel.categoryName ),
                                )));
                  }
                },
              ),
            ),
          ),
        ),
      )
    ]);
  }

  Widget getImageShape(int id) {
    if (id == 0) {
      return ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(35),
        child: CachedNetworkImage(
          imageUrl: 'https://picsum.photos/495',
          height: 70,
          width: 70,
          fit: BoxFit.cover,
        ),
      );
    } else if (id == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          'https://picsum.photos/497',
          width: 70,
          height: 70,
          fit: BoxFit.cover,
        ),
      );
    } else if (id == 2) {
      return SizedBox(
        width: 75,
        height: 75,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            'https://picsum.photos/588',
          ),
        ),
      );
    } else {
      return SizedBox(
        width: 75,
        height: 75,
        child: ClipPath(
          clipper: MyTriangle(),
          child: (Image.network(
            'https://picsum.photos/496',
          )),
        ),
      );
    }
  }
}

class MyTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addPolygon([
      const Offset(2.0, 75.0),
      Offset(size.width, 40.0),
      const Offset(2.0, 2.0)
    ], true);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
