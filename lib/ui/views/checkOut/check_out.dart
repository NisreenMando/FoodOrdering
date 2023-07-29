
import 'package:easy_shopping/core/data/models/api/model_checkout.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/add_credit.dart/add_credit.dart';
import 'package:easy_shopping/ui/views/final_%20checkout.dart/final_checkout.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        //  bottomNavigationBar: const CustomNavigator( index: 4, ),
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Padding(
            padding:
                EdgeInsets.only(top: size.height / 20, bottom: 15, left: 10),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              color: AppColors.gray600,
              iconSize: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 15,
              top: size.height / 20,
            ),
            child: Text(
              tr('check'),
              style: const TextStyle(fontSize: 22, color: AppColors.gray600),
            ),
          ),
        ]),
        Padding(
          padding: EdgeInsets.only(
            top: size.height / 20,
            left: 25,
            bottom: size.height / 20,
          ),
          child: Text(
            tr('addres'),
            style: const TextStyle(color: AppColors.gray600, fontSize: 13),
          ),
        ),
        Row(
          children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  tr('ave'),
                  style: const TextStyle(
                      color: AppColors.gray600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: size.width / 20, top: 10),
                child: Text(
                  tr('brook'),
                  style: const TextStyle(
                      color: AppColors.gray600,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(left: size.width / 4),
              child: Text(tr('change'),
                  style: const TextStyle(
                    color: AppColors.orange,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.height / 40, bottom: size.height / 40),
          child: Container(
            width: size.width / 1,
            height: 15,
            color: AppColors.gray300,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 15),
          child: Row(
            children: [
              Text(tr('paymen'),
                  style: const TextStyle(
                    color: AppColors.gray400,
                    fontSize: 13,
                  )),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      opaque: false, // set to false
                      pageBuilder: (_, __, ___) => const AddCredit(),
                      // builder: (context) => const AddCredit(),
                      // settings: const RouteSettings(name: '/aaa'),
                      // maintainState: true,
                      // fullscreenDialog: false
                    ),
                  );
                },
                child: Row(children: [
                  const Icon(
                    Icons.add,
                    color: AppColors.orange,
                  ),
                  Text(tr('add_card'),
                      style: const TextStyle(
                        color: AppColors.orange,
                        fontSize: 13,
                      ))
                ]),
              )
            ],
          ),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Pay.check.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemBuilder: (context, index) {
              return push(
                iconpath: Pay.check[index].iconpath,
                data: Pay.check[index].data,
              );
            }),
        Padding(
          padding: EdgeInsets.only(top: size.height / 50),
          child: Container(
            width: size.width / 1,
            height: 15,
            color: AppColors.gray100,
          ),
        ),
        ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: Account.personal.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemBuilder: (context, index) {
              return coins(
                  type: Account.personal[index].type,
                  money: Account.personal[index].money);
            }),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Container(
            width: size.width / 1,
            height: 15,
            color: AppColors.gray100,
          ),
        ),
        CustomButton(
          title: tr('sen'),
          onpressd: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false, // set to false
                pageBuilder: (_, __, ___) => const FinalCheckout(),
                // builder: (context) => const AddCredit(),
                // settings: const RouteSettings(name: '/aaa'),
                // maintainState: true,
                // fullscreenDialog: false
              ),
            );
          },
          backgroundColor: AppColors.orange,
          textColor: AppColors.white,
        ),
      ]),
    )));
  }

  Widget push({String? iconpath, String? data}) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            width: size.width / 1,
            height: size.height / 12,
            decoration: BoxDecoration(
                color: AppColors.gray100,
                borderRadius: BorderRadius.circular(7)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width / 20),
              child: Row(
                children: [
                  // Image.asset(iconpath!),
                  Image.asset(
                    'assets/images/visa.png',
                    width: size.width / 7,
                    height: size.height / 12,
                  ),
                  Text(
                    data!,
                    style: const TextStyle(
                      color: AppColors.gray600,
                      fontSize: 13,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: size.width / 25,
                    height: size.height / 45,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.orange),
                        borderRadius: BorderRadius.circular(50)),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget coins({
    String? type,
    String? money,
  }) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          child: Row(
            children: [
              Text(
                type!,
                style: const TextStyle(color: AppColors.gray600, fontSize: 13),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: size.height / 40),
                child: Text(money!,
                    style: const TextStyle(
                        color: AppColors.gray600,
                        fontSize: 11,
                        fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
