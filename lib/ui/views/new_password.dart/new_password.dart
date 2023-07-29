import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({
    Key? key,
  }) : super(key: key);

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 20, vertical: size.height / 10),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          tr('new_password'),
                          style: const TextStyle(
                              fontSize: 30,
                              color: AppColors.gray600,
                              letterSpacing: 0.25),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height / 25,
                          horizontal: size.width / 16),
                      child: Center(
                        child: Text(
                          tr('please_enter_new'),
                          style: const TextStyle(
                              fontSize: 14, color: AppColors.gray400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 15, vertical: 10),
                      child: CustomTextFormField(
                        textColor: AppColors.gray100,
                        backgroundColor: AppColors.gray300,
                        controller: passwordcontroller,
                        labeltext: tr('new_password'),
                        borderRaduis: 35,
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        keyboardType: TextInputType.text,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            borderSide: BorderSide(color: Colors.blue)),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return tr('password_is_required');
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 15, vertical: 10),
                      child: CustomTextFormField(
                        textColor: AppColors.gray100,
                        backgroundColor: AppColors.gray300,
                        controller: confirmpasswordcontroller,
                        labeltext: tr('confirm'),
                        borderRaduis: 35,
                        keyboardType: TextInputType.text,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return tr('password_confirmation');
                          }
                          return null;
                        },
                      ),
                    ),
                    CustomButton(
                        margin: EdgeInsets.only(
                          bottom: size.height / 5,
                          left: size.width / 18,
                          top: 5,
                          right: size.width / 18,
                        ),
                        title: tr('next'),
                        fontWeight: FontWeight.w400,
                        backgroundColor: AppColors.orange,
                        textColor: AppColors.white,
                        onpressd: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordcontroller.text ==
                                confirmpasswordcontroller.text) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView(
                                          onMenuTap: () {},
                                        )),
                              );
                            } else {
                              BotToast.showText(
                                  text:
                                      ' password && confirmpassword No match');
                            }
                          }
                        }),
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
