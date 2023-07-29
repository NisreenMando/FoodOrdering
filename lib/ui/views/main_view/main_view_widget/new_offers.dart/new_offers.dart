
import 'package:easy_shopping/core/data/models/api/model_offers.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class OffersView extends StatefulWidget {
  const OffersView({
    Key? key,
  }) : super(key: key);

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // bottomNavigationBar: const CustomNavigator(index: 1, ),
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: size.height / 40,
              start: size.width / 20,
              end: size.width / 20,
              top: size.height / 13,
            ),
            child: Row(
              children: [
                Text(
                  tr('latest_offers'),
                  style:
                      const TextStyle(fontSize: 25, color: AppColors.gray600),
                ),
                const Spacer(),
                Image.asset(
                  'assets/home/shopping.png',
                  color: AppColors.gray600,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: size.width / 20, bottom: size.height / 20),
            child: Text(
              tr('find_discount'),
              style: const TextStyle(fontSize: 15, color: AppColors.gray400),
            ),
          ),
          SizedBox(
            height: size.height / 9,
            width: size.width / 1.3,
            child: CustomButton(
              title: tr('check_offers'),
              fontsize: 12,
              fontWeight: FontWeight.w400,
              backgroundColor: AppColors.orange,
              textColor: AppColors.white,
              onpressd: () {},
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: OffersFood.kind.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              itemBuilder: (context, index) {
                return delivery(
                    iconpathst: OffersFood.kind[index].iconpathst,
                    iconpath: OffersFood.kind[index].iconpath,
                    ratings: OffersFood.kind[index].ratings,
                    city: OffersFood.kind[index].city,
                    value: OffersFood.kind[index].value,
                    stylefood: OffersFood.kind[index].stylefood);
              }),
        ],
      ),
    )));
  }

  Widget delivery({
    String? iconpath,
    String? stylefood,
    String? value,
    String? city,
    String? ratings,
    String? iconpathst,
  }) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: size.width / 1,
          decoration: const BoxDecoration(color: AppColors.black),
          child: Image.network(
            iconpath!,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width / 15, top: 10),
          child: Text(
            stylefood!,
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.gray400,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.width / 15, top: 5, bottom: size.height / 30),
          child: Row(
            children: [
              Image.asset(
                iconpathst!,
                width: 20,
                height: 20,
              ),
              Text(value!, style: const TextStyle(color: AppColors.orange)),
              Text(ratings!,
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.gray400)),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(10)),
                      width: 3,
                      height: 3,
                    ),
                    Text(city!,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.gray400)),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
