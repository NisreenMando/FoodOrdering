import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/add_credit.dart/add_credit.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        //  bottomNavigationBar: const CustomNavigator(index: 5),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 25, vertical: size.height / 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                      color: AppColors.gray600,
                      iconSize: 25,
                    ),
                    Text(
                      tr('payment'),
                      style: const TextStyle(
                          color: AppColors.gray600, fontSize: 18),
                    ),
                    const Spacer(),
                    Image.asset(
                      'assets/images/shopping.png',
                      color: AppColors.gray600,
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width / 15),
              child: Text(
                tr('customize'),
                style: const TextStyle(
                    color: AppColors.gray600,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.25),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height / 25, horizontal: size.width / 13),
              child: Container(
                width: size.width / 1,
                height: 0.50,
                decoration: const BoxDecoration(color: AppColors.gray400),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height / 13),
              child: Container(
                width: size.width / 1,
                height: size.height / 3,
                decoration: BoxDecoration(color: AppColors.gray300, boxShadow: [
                  BoxShadow(
                    color: AppColors.gray400.withOpacity(0.5),
                    blurRadius: size.height / 20,
                    offset: const Offset(0, 25),
                  ),
                ]),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width / 7,
                              top: size.height / 18,
                              bottom: size.height / 75,
                              right: size.width / 4),
                          child: Text(
                            tr('cash'),
                            style: const TextStyle(
                                color: AppColors.gray600,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                        ),
                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Image.asset('assets/images/true.png'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Container(
                        width: size.width / 1.4,
                        height: 0.50,
                        decoration:
                            const BoxDecoration(color: AppColors.gray400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 12,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: size.width / 20,
                            ),
                            child: Image.asset('assets/images/visa.png'),
                          ),
                          const Text(
                            '2187',
                            style: TextStyle(color: AppColors.gray400),
                          ),
                          SizedBox(
                            width: size.width / 2.3,
                            height: size.height / 10,
                            child: CustomButton(
                              title: tr('delete'),
                              fontsize: 10,
                              textColor: AppColors.orange,
                              borderColor: AppColors.orange,
                              backgroundColor: AppColors.gray200,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: size.width / 1.4,
                      height: 0.50,
                      decoration: const BoxDecoration(color: AppColors.gray400),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: size.width / 2.3,
                        top: size.height / 30,
                      ),
                      child: Text(
                        tr('Other'),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: AppColors.gray400),
                      ),
                    )
                  ],
                ),
              ),
            ),
            CustomButton(
              title: tr('another'),
              backgroundColor: AppColors.orange,
              textColor: AppColors.white,
              icon: Icons.add,
              onpressd: () {
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
            ),
            SizedBox(
              height: size.height / 3,
            )
          ],
        ),
      ),
    ));
  }
}
