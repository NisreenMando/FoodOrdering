
import 'package:easy_shopping/core/data/models/api/model_dessrts.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_net_image.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class Desserts extends StatefulWidget {
  const Desserts({Key? key}) : super(key: key);

  @override
  State<Desserts> createState() => _DessertsState();
}

class _DessertsState extends State<Desserts> {
  final searchcontrolle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        //    bottomNavigationBar: const CustomNavigator(index: 0),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width / 20,
                    right: size.width / 20,
                    top: size.height / 20,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                          ),
                          color: AppColors.gray600,
                          iconSize: 30,
                        ),
                        Text(
                          tr('desserts'),
                          style: const TextStyle(
                              color: AppColors.gray600, fontSize: 22),
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/shopping.png',
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 25,
                      bottom: size.height / 30,
                      right: size.width / 15,
                      left: size.width / 15),
                  child: CustomTextFormField(
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: searchcontrolle,
                      labeltext: tr('search'),
                      style: const TextStyle(height: 0.50),
                      icon: const Icon(Icons.search, color: AppColors.gray400),
                      borderRaduis: 35),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 300),
                  child: ListView.builder(
                      itemCount: DessertsType.types.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      itemBuilder: (context, index) {
                        return foodtype(
                          iconPath: DessertsType.types[index].iconPath,
                          typeFood: DessertsType.types[index].typeFood,
                          itemsFood: DessertsType.types[index].itemsFood,
                          type: DessertsType.types[index].type,
                        );
                      }),
                ),
              ]),
        )));
  }

  Widget foodtype({
    String? iconPath,
    String? typeFood,
    String? itemsFood,
    String? type,
  }) {
    final size = MediaQuery.of(context).size;
    return Column(children: [
      Stack(children: [
        CustomNetImage(
          imageUrl: iconPath!,
          alignment: Alignment.center,
          imgFit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: size.height / 2.5,
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height / 3.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(start: size.width / 20),
                child: Text(
                  typeFood!,
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: size.width / 20,
                  top: 10,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/stars.png',
                      width: 15,
                      height: 15,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '4.9',
                        style: TextStyle(color: AppColors.orange, fontSize: 11),
                      ),
                    ),
                    Text(
                      itemsFood!,
                      textAlign: TextAlign.end,
                      style:
                          const TextStyle(fontSize: 12, color: AppColors.black),
                    ),
                    Container(
                      width: 2,
                      height: 2,
                      color: AppColors.orange,
                    ),
                    Text(
                      type!,
                      textAlign: TextAlign.end,
                      style:
                          const TextStyle(fontSize: 12, color: AppColors.black),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    ]);
  }
}
