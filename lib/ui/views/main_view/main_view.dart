import 'package:easy_shopping/core/data/enums/button_navigation_enum.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/button_navigation.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/menu.dart/new_menu.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/new_more.dart/new_more.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/new_offers.dart/new_offers.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/new_prpfile.dart/new_profile.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class MainView extends StatefulWidget {
  MealModel mealModel = MealModel();
  // final ButtonNavigationEnum buttonNavigationEnum;
   MainView({super.key,required this.mealModel});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  ButtonNavigationEnum selected = ButtonNavigationEnum.HOME;
  PageController controller = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: Container(
          width: size.width * 0.5,
          color: AppColors.red,
          child: ListView(
            children: const [
              DrawerHeader(child: Text('Header')),
              ListTile(
                title: Text('1111'),
              ),
              ListTile(
                title: Text('2222'),
              )
            ],
          )),
      bottomNavigationBar: BottomNavigationWidget(
        buttonNavigationEnum: selected,
        onTap: (selectedEnum, pageNumber) {
          controller.animateToPage(pageNumber,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInCirc);
          setState(() {
            selected = selectedEnum;
          });
        },
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: (pageNumber) {},
        children: [
          MenuView(mealModel: MealModel(id: widget.mealModel.id,),),
          const OffersView(),
          HomeView(
        onMenuTap: (){},
          ),
          const ProfileView(),
          const MoreView(),
        ],
      ),
    ));
  }
}
