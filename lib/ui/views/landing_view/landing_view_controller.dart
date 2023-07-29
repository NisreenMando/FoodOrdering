import 'package:easy_shopping/core/data/enums/notification_type.dart';
import 'package:easy_shopping/core/services/base_controller.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class landingViewController extends BasController {
  Rx<Color> buttonColor = AppColors.amber200.obs;
 @override
  void onInit() async {
    notificationService.notifcationStream.stream.listen((event) {
      if (event.notifctionType == NotificationType.CHANGECOLOR.name) {
        buttonColor.value = AppColors.blue;
      }
    });
    super.onInit();
  }
}
