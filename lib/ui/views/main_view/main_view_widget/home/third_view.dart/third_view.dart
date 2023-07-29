import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_shopping/core/data/models/api/model_home2.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class ThirdView extends StatefulWidget {
  final List<Recent> third;
  const ThirdView({super.key, required this.third});

  @override
  State<ThirdView> createState() => _ThirdViewState();
}

class _ThirdViewState extends State<ThirdView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Recent.items.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
              itemBuilder: (context, index) {
                return fsat(
                  iconpath: widget.third[index].iconpath,
                  hotdrink: widget.third[index].hotdrink,
                  stylefood: widget.third[index].stylefood,
                  ratings: widget.third[index].ratings,
                );
              }),
        ),
      ),
    );
  }

  Widget fsat(
      {String? iconpath,
      String? stylefood,
      String? hotdrink,
      String? country,
      String? ratings}) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: size.width / 4,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: iconpath!,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tr(stylefood!),
                style: const TextStyle(
                    color: AppColors.gray300,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    tr('hotdrink'),
                    style:
                        const TextStyle(fontSize: 12, color: AppColors.gray100),
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
                  Text(tr('country'))
                ],
              ),
              Row(
                children: [
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
                  Text(tr(ratings!),
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.gray100,
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
