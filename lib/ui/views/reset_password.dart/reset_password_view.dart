import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shopping/core/data/models/api/model_login.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

import '../very_vecation_code.dart/very_vecation_code_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController emailcontrolle = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   emailcontrolle.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(
                          top: size.height / 10, bottom: size.height / 30),
                      child: Text(
                        tr('reset_password'),
                        style: const TextStyle(
                            color: AppColors.gray600,
                            fontSize: 25,
                            letterSpacing: 0.50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        start: size.width / 13, bottom: size.height / 10),
                    child: Text(
                      tr('please_enter'),
                      style: const TextStyle(
                        color: AppColors.gray400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 10,
                    ),
                    child: CustomTextFormField(
                      textColor: AppColors.black,
                      backgroundColor: AppColors.gray300,
                      controller: emailcontrolle,
                      labeltext: tr('email'),
                      borderRaduis: 35,
                      keyboardType: TextInputType.emailAddress,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return tr('email is required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 25, vertical: 15),
                      child: CustomButton(
                        title: tr('send'),
                        fontsize: 14,
                        fontWeight: FontWeight.w300,
                        onpressd: () {
                          if (formKey.currentState!.validate()) {
                            for (int i = 0; i < Login.user.length; i++) {
                              if (emailcontrolle.text == Login.user[i].email) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerificationCodeView()),
                                );
                                return;
                              } else {
                                i == Login.user.length - 1
                                    ? BotToast.showText(text: tr('errore'))
                                    : null;
                              }
                            }
                          }
                        },
                        backgroundColor: AppColors.orange,
                        textColor: AppColors.white,
                      )),
                  SizedBox(
                    height: size.height / 1.5,
                  ),
                ]),
          ),
        )));
  }
}
