import 'package:easy_shopping/core/data/enums/message_type.dart';
import 'package:easy_shopping/core/data/models/api/meal_model.dart';
import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
import 'package:easy_shopping/core/data/repositories/user_repository.dart';
import 'package:easy_shopping/core/services/base_controller.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_toast.dart';
import 'package:easy_shopping/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends BasController {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  void login() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFutureFunction(
          function: UserRepository()
              .login(
                  email: emailController.text,
                  password: passwordController.text)
              .then((value) {
        value.fold((l) {
          isLoading.value = false;
          CustomToast.showMessage(
              messageType: MessageType.REJECTED, message: l);
        }, ((r) {
          SharedPrefrenceRepository().setTokenInfo(r);
          Get.off((MainView(
            mealModel: MealModel(),
          )));
        }));
      }));
    }
  }
}
// TextEditingController emailController =
//       TextEditingController(text: 'Test@gmail.com');
//   TextEditingController passwordController =
//       TextEditingController(text: 'Test@1234');

//   final formKey = GlobalKey<FormState>();
//   RxBool isLoading = false.obs;
//   void login() {
//     if (formKey.currentState!.validate()) {
//       runFullLoadingFutureFunction(
//           function: UserRepository()
//               .login(
//                   email: emailController.text,
//                   password: passwordController.text)
//               .then((value) {
//         value.fold((l) {
//           isLoading.value = false;
//           CustomToast.showMessage(
//               messageType: MessageType.REJECTED, message: l);
//         }, ((r) {
//           SharedPrefrenceRepository().setTokenInfo(r);
//           Get.off((MainView(
//             mealModel: MealModel(),


