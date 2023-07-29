
import 'package:easy_shopping/core/data/models/api/model_more.dart';
import 'package:easy_shopping/core/data/models/api/model_notifacation.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/views/about_us/abouts_us.dart';
import 'package:easy_shopping/ui/views/inbox.dart/inbox.dart';
import 'package:easy_shopping/ui/views/my_order.dart/my_order.dart';
import 'package:easy_shopping/ui/views/notifacation/notifacation.dart';
import 'package:easy_shopping/ui/views/payment.dart/payment.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class MoreView extends StatefulWidget {
  const MoreView({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // bottomNavigationBar: const CustomNavigator(index: 5, ),
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: size.height / 18, horizontal: 20),
        child: Row(
          children: [
            Text(
              tr('more'),
              style: const TextStyle(fontSize: 25, color: AppColors.gray600),
            ),
            const Spacer(),
            Image.asset(
              'assets/images/shopping.png',
              color: AppColors.gray600,
            ),
          ],
        ),
      ),
      Expanded(
        child: ListView.builder(
            // physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: More.moredata.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return kind(
                iconpath: More.moredata[index].iconpath,
                data: More.moredata[index].data,
                id: More.moredata[index].id,
                number: More.moredata[index].number,
              );
            }),
      ),
    ])));
  }

  Widget kind({
    String? iconpath,
    String? data,
    int? id,
    String? number,
  }) {
    final size = MediaQuery.of(context).size;
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: size.width / 1,
              color: AppColors.transparent,
            ),
            InkWell(
              onTap: () {
                if (id == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Payment()));
                } else if (id == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyOrder()));
                } else if (id == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifacation()));
                } else if (id == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageView()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutsUs()));
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: size.height / 50),
                child: Container(
                  width: size.width / 1.2,
                  height: size.height / 8,
                  decoration: BoxDecoration(
                      color: AppColors.gray300,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: size.width / 1.2),
              child: Container(
                  width: size.width / 10,
                  height: size.height / 18,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(stops: [
                          0.5,
                          0.5
                        ], colors: [
                          AppColors.gray300,
                          AppColors.gray300,
                        ]),
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 5),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        iconSize: 18,
                        color: AppColors.gray500,
                        onPressed: () {
                          if (id == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Payment()));
                          } else if (id == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyOrder()));
                          } else if (id == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Notifacation()));
                          } else if (id == 3) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MessageView()));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutsUs()));
                          }
                        },
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: size.width / 1.7),
              child: Container(
                width: size.width / 7,
                height: size.height / 13,
                decoration: BoxDecoration(
                    color: AppColors.gray400.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  onTap: () {
                    if (id == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Payment()));
                    } else if (id == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyOrder()));
                    } else if (id == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Notifacation()));
                    } else if (id == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessageView()));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutsUs()));
                    }
                  },
                  child: Image.asset(
                    iconpath!,
                    color: AppColors.gray500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (id == 0) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Payment()));
                } else if (id == 1) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyOrder()));
                } else if (id == 2) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Notifacation()));
                } else if (id == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MessageView()));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutsUs()));
                }
              },
              child: Text(
                data!,
                style: const TextStyle(fontSize: 15, color: AppColors.gray400),
                /*  'عدد الاعلانات[' + Search.flower.length.toString() + ']',*/
              ),
            ),
            id == 2
                ? Padding(
                    padding:
                        EdgeInsetsDirectional.only(start: size.width / 1.5),
                    child: Container(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 5, bottom: 5),
                        width: size.width / 14,
                        height: size.height / 25,
                        decoration: BoxDecoration(
                            color: AppColors.red.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(25)),
                        child: Text(
                          Notice.not.length.toString(),
                          style: const TextStyle(
                              color: AppColors.white, fontSize: 10),
                        )),
                  )
                : const SizedBox()
          ],
        ),
      ],
    );
  }
}
