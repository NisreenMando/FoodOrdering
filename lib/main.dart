// import 'package:easy_shopping/app/my_app.dart';
// import 'package:easy_shopping/core/data/models/api/notifacations_model.dart';
// import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
// import 'package:easy_shopping/core/services/connectivity_service.dart';
// import 'package:easy_shopping/core/services/location_service.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// //SharedPreferences? globalSharedPreferenc;
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();

// //  globalSharedPreferenc = await SharedPreferences.getInstance();
//   await Get.putAsync<SharedPreferences>(() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs;
//   });
//   Get.put(SharedPrefrenceRepository());
//   /////////////////////////////////////
//   Get.put(ConnectivityService());
//   /////////////////////////////////////
//   Get.put(LocationService());

// // ...

//   try {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     //اول ما يفتح التطبيق واحصل على fcmtoken بعدها منعمل call api
//     final fcmToken = await FirebaseMessaging.instance.getToken();
//     //call api//
//     FirebaseMessaging.instance.onTokenRefresh
//         //ووقت بيتحدث برجع بعمل call api//
//         .listen((fcmToken) {
//       //call api//
//     }).onError((err) {});
//     print(fcmToken);
//     if (GetPlatform.isIOS) {
//       FirebaseMessaging messaging = FirebaseMessaging.instance;

//       NotificationSettings settings = await messaging.requestPermission(
//         alert: true,
//         announcement: false,
//         badge: true,
//         carPlay: false,
//         criticalAlert: false,
//         provisional: false,
//         sound: true,
//       );

// // print('User granted permission: ${settings.authorizationStatus}');
//     }

// //// when app in forground//
// //   نحنا منهدل كيفية اظهار الاشعارmessage اذا في بيانات في الاشعارات منقدر نحصل عليها من
// //او بقدر استعملو لتعديل قيمة معينة
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
// //   {
// //     notifction_type: sub_exp,
// //     title: subciption,
// //     text: Your sub expired,
// //     sub_status: false
// //   }
//       print('Got a message whilst in the foreground!');
//       print('Message data: ${message.data}');
//       NotifictionModel model = NotifictionModel.fromJson(message.data);
//       if (message.notification != null) {
//         print('Message also contained a notification: ${message.notification}');
//       }
//     });
//   } catch (e) {
//     print(e);
//   }
//   runApp(const MyApp());
// }
//SharedPreferences? globalSharedPreferenc;
import 'package:easy_shopping/app/my_app.dart';
import 'package:easy_shopping/app/my_app_controller.dart';
import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
import 'package:easy_shopping/core/services/cart_services.dart';
import 'package:easy_shopping/core/services/connectivity_service.dart';
import 'package:easy_shopping/core/services/location_service.dart';
import 'package:easy_shopping/core/services/notifcations_srvice.dart';
import 'package:easy_shopping/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //globalSharedPreferenc = await SharedPreferences.getInstance();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });

  Get.put(SharedPrefrenceRepository());
  Get.put(CartService());
  Get.put(LocationService());
  Get.put(ConnectivityService());
  Get.put(MyAppController());

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}