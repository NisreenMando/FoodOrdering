
import 'package:easy_shopping/core/data/models/api/model_inbox.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        //   bottomNavigationBar: const CustomNavigator(index: 5),
        body: SafeArea(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width / 20, vertical: size.height / 35),
        child: Row(children: [
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
            tr('inbox'),
            style: const TextStyle(color: AppColors.gray600, fontSize: 23),
          ),
          const Spacer(),
          Image.asset('assets/images/shopping.png')
        ]),
      ),
      Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Message.leteer.length,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          itemBuilder: (context, index) {
            return mission(
              promotions: Message.leteer[index].promotions,
              iconpath: Message.leteer[index].iconpath,
              month: Message.leteer[index].month,
              details: Message.leteer[index].details,
            );
          },
        ),
      ),
    ])));
  }

  Widget mission({
    String? promotions,
    String? details,
    String? month,
    String? iconpath,
  }) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        width: size.width / 1,
        height: size.height / 8,
        color: AppColors.gray300,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12,
              ),
              child: Row(
                children: [
                  Container(
                    height: size.height / 70,
                    width: size.width / 40,
                    decoration: BoxDecoration(
                        color: AppColors.orange,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      tr(promotions!),
                      style: const TextStyle(
                          color: AppColors.gray600, fontSize: 12),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    tr(month!),
                    style:
                        const TextStyle(color: AppColors.gray400, fontSize: 10),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: Row(children: [
              Text(
                tr(details!),
                style: const TextStyle(color: AppColors.gray400, fontSize: 13),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Image.asset(
                  iconpath!,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
