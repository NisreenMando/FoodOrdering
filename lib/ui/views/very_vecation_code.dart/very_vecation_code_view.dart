import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/views/new_password.dart/new_password.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeView extends StatefulWidget {
  const VerificationCodeView({Key? key}) : super(key: key);

  @override
  State<VerificationCodeView> createState() => _VerificationCodeViewState();
}

TextEditingController textEditingController = TextEditingController();

class _VerificationCodeViewState extends State<VerificationCodeView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height / 8,
                  left: size.width / 10,
                  right: size.width / 10,
                  bottom: 10),
              child: Text(
                tr('very_vecation'),
                style: const TextStyle(
                  color: AppColors.gray300,
                  fontSize: 25,
                  letterSpacing: 0.25,
                ),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: size.width / 10,
                  right: size.width / 10,
                  top: 10,
                  bottom: size.height / 10),
              child: Text(
                tr('reset_mobile'),
                style: const TextStyle(color: AppColors.gray400, fontSize: 14),
                maxLines: 3,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                bottom: size.height / 25,
              ),
              child: PinCodeTextField(
                enableActiveFill: true,
                autoDisposeControllers: false,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(15),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: AppColors.gray200,
                    selectedColor: AppColors.gray200,
                    activeColor: AppColors.gray200,
                    selectedFillColor: AppColors.gray200,
                    inactiveColor: AppColors.gray200,
                    inactiveFillColor: AppColors.gray200,
                    disabledColor: AppColors.gray100,
                    fieldOuterPadding: const EdgeInsets.symmetric(
                      horizontal: 15,
                    )),
                controller: textEditingController,
                appContext: context,
                length: 4,
                animationType: AnimationType.fade, //!اضافة جديدة
                autoFocus: false,
                cursorColor: AppColors.gray100,
                onChanged: (value) {},
                obscureText: true,
                enablePinAutofill: true, //!اضافة جديدة
                obscuringCharacter: '*',
                validator: (value) {
                  return null;
                },
              ),
            ),
            CustomButton(
                // margin: EdgeInsets.symmetric(horizontal: size.width / 10),
                title: tr('next'),
                fontsize: 16,
                fontWeight: FontWeight.w400,
                backgroundColor: AppColors.orange,
                textColor: AppColors.white,
                onpressd: () {
                  if (textEditingController.text == '1234') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewPasswordView()),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width / 4.7, vertical: 20),
              child: Row(children: [
                Text(
                  tr('didnt_receive'),
                  style: const TextStyle(
                    color: AppColors.gray400,
                    fontSize: 14,
                  ),
                ),
                Text(
                  tr('click_here'),
                  style: const TextStyle(
                      color: AppColors.orange,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                )
              ]),
            ),
          ]),
        )));
  }
}
