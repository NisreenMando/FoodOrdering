import 'package:easy_shopping/core/data/models/api/model_notifacation.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class Notifacation extends StatefulWidget {
  const Notifacation({Key? key}) : super(key: key);

  @override
  State<Notifacation> createState() => _NotifacationState();
}

class _NotifacationState extends State<Notifacation> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.white,
      //    bottomNavigationBar: const CustomNavigator(index: 5),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
              left: size.width / 20,
              right: size.height / 25,
              bottom: size.height / 40,
              top: size.height / 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              color: AppColors.gray700,
              iconSize: 30,
            ),
            Text(
              tr('notaf'),
              style: const TextStyle(color: AppColors.gray700, fontSize: 23),
            ),
            const Spacer(),
            Image.asset('assets/images/shopping.png')
          ]),
        ),
        Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: Notice.not.length,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              itemBuilder: (context, index) {
                return details(
                    warning: Notice.not[index].warning,
                    hour: Notice.not[index].hour);
              }),
        ),
      ]),
    );
  }

  Widget details({String? warning, String? hour}) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width / 1,
      height: size.height / 9,
      color: AppColors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: size.width / 13),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(100)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width / 15, vertical: 5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        warning!,
                        style: const TextStyle(
                            color: AppColors.gray700, fontSize: 15),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, bottom: 10),
                        child: Text(
                          hour!,
                          style: const TextStyle(
                              color: AppColors.gray400, fontSize: 13),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          Container(
            width: size.width / 1.2,
            height: 1,
            decoration:
                BoxDecoration(color: AppColors.gray400.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
