import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_shopping/core/data/models/api/model_home4.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class SecondView extends StatefulWidget {
  final List<FoodPapular> second;
  const SecondView({super.key, required this.second});

  @override
  State<SecondView> createState() => _SecondView();
}

class _SecondView extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: FoodPapular.delivery.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              itemBuilder: (context, index) {
                return food(
                  iconpath: widget.second[index].iconpath,
                  typefo: widget.second[index].typefo,
                  city: widget.second[index].city,
                  drink: widget.second[index].drink,
                );
              }),
        ),
      ]),
    );
  }

  Widget food({String? iconpath, String? typefo, String? drink, String? city}) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          width: size.width / 1.6,
          height: size.height / 4.5,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: iconpath!,
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width / 25, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tr(typefo!),
                style: const TextStyle(
                    color: AppColors.gray700,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr(drink!),
                    style:
                        const TextStyle(color: AppColors.gray400, fontSize: 13),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7, right: 7),
                    child: Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 35),
                    child: Text(
                      tr(city!),
                      style: const TextStyle(
                          color: AppColors.gray400, fontSize: 13),
                    ),
                  ),
                  Image.asset(
                    'assets/home/stars.png',
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
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
