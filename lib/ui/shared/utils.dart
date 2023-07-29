import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shopping/app/my_app_controller.dart';
import 'package:easy_shopping/core/data/enums/connectivity_status_enums.dart';
import 'package:easy_shopping/core/data/enums/message_type.dart';
import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
import 'package:easy_shopping/core/services/cart_services.dart';
import 'package:easy_shopping/core/services/connectivity_service.dart';
import 'package:easy_shopping/core/services/location_service.dart';
import 'package:easy_shopping/core/services/notifcations_srvice.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

bool isEmail(String value) {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return regExp.hasMatch(value);
}

bool isValidNumber(String value) {
  RegExp regExp =
      RegExp(r'^(?:\+971|00971|0)?(?:50|51|52|55|56|2|3|4|6|7|9)\d{7}$');
  return regExp.hasMatch(value);
}

// ignore: non_constant_identifier_names
double ScreenWidth(double percent) {
  return Get.size.width / percent;
}

// ignore: non_constant_identifier_names
double ScreenHeight(double percent) {
  return Get.size.height / percent;
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();

Future cLaunchUrl(Uri url) async {
  if (await launchUrl(
    url,
  )) {
    CustomToast.showMessage(
        message: 'Cant lunch url', messageType: MessageType.REJECTED);
  }
}

void CustomLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: AppColors.amber200, borderRadius: BorderRadius.circular(15)),
        width: ScreenWidth(4),
        height: ScreenHeight(4),
        child: SpinKitCircle(
          color: AppColors.blue,
          size: ScreenWidth(8),
        ),
      );
    });
double get taxAmount => 0.18;
double get deliverAmount => 0.1;




CartService get cartService => Get.find<CartService>();
///
LocationService get locationService => Get.find<LocationService>();
ConnectivityService get connectivityService => Get.find<ConnectivityService>();
NotificationService get notificationService => Get.find<NotificationService>();

bool get isOnline =>
Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}