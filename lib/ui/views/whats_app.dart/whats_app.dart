
import 'package:easy_shopping/core/data/models/api/model_chat.dart';
import 'package:easy_shopping/core/data/models/api/model_chat_screen.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_net_image.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  TextEditingController searchcontrolle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CustomNetImage(
                            imageUrl: 'https://picsum.photos/789',
                            width: size.width / 5,
                            height: size.height / 9,
                            imgFit: BoxFit.cover,
                            alignment: Alignment.center),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          tr('chats'),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: size.width / 10,
                          height: size.height / 18,
                          decoration: BoxDecoration(
                              color: AppColors.gray100.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25)),
                          child: const Icon(Icons.camera_alt)),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                            width: size.width / 10,
                            height: size.height / 18,
                            decoration: BoxDecoration(
                                color: AppColors.gray100.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(25)),
                            child: const Icon(Icons.edit)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 40, horizontal: size.width / 20),
                  child: CustomTextFormField(
                      onChanged: (value) {
                        setState(() {});
                        return null;
                      },
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray100.withOpacity(0.2),
                      controller: searchcontrolle,
                      labeltext: tr('search'),
                      style: const TextStyle(height: 0.50, fontSize: 14),
                      icon: const Icon(Icons.search, color: AppColors.gray400),
                      borderRaduis: 35),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 130),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Conect.chat.length,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      itemBuilder: (context, index) {
                        return conecting(
                          iconpath: Conect.chat[index].iconpath,
                          name: Conect.chat[index].name,
                        );
                      }),
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: Conection.conectioning.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    itemBuilder: (context, index) {
                      return can(
                          imgurl: Conection.conectioning[index].imgurl,
                          details: Conection.conectioning[index].details,
                          time: Conection.conectioning[index].time,
                          names: Conection.conectioning[index].names);
                    }),
                SizedBox(
                  height: size.height / 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget conecting({String? iconpath, String? name}) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(alignment: AlignmentDirectional.bottomEnd, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                  width: size.width / 5,
                  height: size.height / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: CustomNetImage(
                      imageUrl: iconpath!,
                      height: 25,
                      width: 25,
                      imgFit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  )),
            ),
          ),
          Positioned(
            right: 17,
            child: Container(
              width: size.width / 30,
              height: size.height / 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.green),
            ),
          )
        ]),
        SizedBox(
          height: size.height / 50,
        ),
        Text(name!),
      ],
    );
  }

  Widget can({
    String? imgurl,
    String? names,
    String? details,
    String? time,
  }) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        children: [
          Row(children: [
            Stack(alignment: AlignmentDirectional.bottomEnd, children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CustomNetImage(
                    imageUrl: imgurl!,
                    width: size.width / 5,
                    height: size.height / 9,
                    imgFit: BoxFit.cover,
                    alignment: Alignment.center,
                  )),
              Positioned(
                right: 7,
                bottom: 2,
                child: Container(
                  width: size.width / 30,
                  height: size.height / 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.green),
                ),
              )
            ]),
            SizedBox(
              width: size.width / 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  names!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  details!,
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                time!,
                style: const TextStyle(fontSize: 8),
              ),
            )
          ])
        ],
      ),
    );
  }
}
