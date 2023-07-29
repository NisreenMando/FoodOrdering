import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/views/checkOut/check_out.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class AddCredit extends StatefulWidget {
  const AddCredit({Key? key}) : super(key: key);

  @override
  State<AddCredit> createState() => _AddCreditState();
}

class _AddCreditState extends State<AddCredit> {
  final TextEditingController _cardNumbercontroller = TextEditingController();
  final TextEditingController _securitycontroller = TextEditingController();
  final TextEditingController _firstNamecontroller = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _monthcontroller = TextEditingController();
  final TextEditingController _yearscontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  bool switchState = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black.withOpacity(0.60),
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.only(top: size.height / 3.5),
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.gray700,
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: size.width / 20),
                  child: Row(
                    children: [
                      Text(
                        tr('add_credit'),
                        style: const TextStyle(
                            color: AppColors.gray600, fontSize: 15),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: size.width / 8,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close,
                            color: AppColors.gray600,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: 12),
                  child: CustomTextFormField(
                      controller: _cardNumbercontroller,
                      labeltext: tr('card'),
                      textColor: AppColors.gray300,
                      backgroundColor: AppColors.gray300,
                      borderRaduis: 35,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            35), // تحافظ على شكل محرر النصوص//
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return tr('card_number');
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: 12),
                  child: Row(children: [
                    Text(tr('expiry'),
                        style: const TextStyle(
                            color: AppColors.gray400, fontSize: 15)),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      width: size.width / 3.5,
                      height: size.height / 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.gray300,
                      ),
                      child: CustomTextFormField(
                          textColor: AppColors.gray300,
                          controller: _monthcontroller,
                          hintText: 'mm',
                          borderRaduis: 35,
                          keyboardType: TextInputType.number,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                35), // تحافظ على شكل محرر النصوص//
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none,
                          ),
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return tr('mr');
                            }
                            return null;
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: size.width / 3.5,
                      height: size.height / 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: AppColors.gray300,
                      ),
                      child: CustomTextFormField(
                          textColor: AppColors.gray300,
                          controller: _yearscontroller,
                          hintText: tr('y'),
                          borderRaduis: 35,
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                35), // تحافظ على شكل محرر النصوص//
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return tr('yr');
                            }
                            return null;
                          }),
                    )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: 12),
                  child: CustomTextFormField(
                      controller: _securitycontroller,
                      hintText: tr('security'),
                      textColor: AppColors.gray300,
                      backgroundColor: AppColors.gray300,
                      borderRaduis: 35,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            35), // تحافظ على شكل محرر النصوص//
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return tr('security_code');
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: 12),
                  child: CustomTextFormField(
                      controller: _firstNamecontroller,
                      labeltext: tr('first'),
                      textColor: AppColors.gray300,
                      backgroundColor: AppColors.gray300,
                      borderRaduis: 35,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            35), // تحافظ على شكل محرر النصوص//
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return tr('first_name');
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 15, vertical: 12),
                  child: CustomTextFormField(
                      controller: _lastName,
                      labeltext: tr('last'),
                      textColor: AppColors.gray300,
                      backgroundColor: AppColors.gray300,
                      borderRaduis: 35,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          borderSide: BorderSide(color: Colors.blue)),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            35), // تحافظ على شكل محرر النصوص//
                        borderSide: BorderSide.none,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return tr('last_name');
                        }
                        return null;
                      }),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width / 10, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        tr('you'),
                        style: const TextStyle(
                            color: AppColors.gray400, fontSize: 12),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                          value: switchState,
                          onChanged: (bool value) {
                            setState(() {
                              switchState = value;
                            });
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 5, right: 5, bottom: size.height / 20),
                  child: CustomButton(
                    textColor: AppColors.white,
                    backgroundColor: AppColors.orange,
                    title: tr('add_card'),
                    //       icon: Icons.add,
                    onpressd: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CheckOut()),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
