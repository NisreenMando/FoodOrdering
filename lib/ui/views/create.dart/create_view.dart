import 'dart:convert';

// import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shopping/core/data/models/api/model_signup.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:easy_shopping/ui/views/login.dart/login_view.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateView extends StatefulWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  final nameController = TextEditingController();
  final emailControlle = TextEditingController();
  final mobilenoController = TextEditingController();
  final addreesController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  late SharedPreferences sharedPreferences;

  bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool isValidpassword(String password) {
    return RegExp('^[a-zA-Z]').hasMatch(password);
  }

  @override
  void initState() {
    super.initState();
    initalGetSavedData();
  }

  void initalGetSavedData() async {
    sharedPreferences =
        await SharedPreferences.getInstance(); //Build sharedpreferences

    if (sharedPreferences.getString('userdata') != null) {
      Map<String, dynamic> mapjson =
          jsonDecode(sharedPreferences.getString('userdata')!);

      DataUsers dataUsers = DataUsers.fromjson(mapjson);

      if (mapjson.isNotEmpty) {
        nameController.value = TextEditingValue(text: dataUsers.name!);
        mobilenoController.value = TextEditingValue(text: dataUsers.mobileno!);
        addreesController.value = TextEditingValue(text: dataUsers.address!);
        emailControlle.value = TextEditingValue(text: dataUsers.email!);
        confirmPasswordController.value =
            TextEditingValue(text: dataUsers.confirmpassword!);
        passwordController.value = TextEditingValue(text: dataUsers.password!);
      }
    }
  }

  void storeData() {
    /////////
    DataUsers dataUsers;
    dataUsers = DataUsers(
        address: addreesController.text,
        confirmpassword: confirmPasswordController.text,
        email: emailControlle.text,
        mobileno: mobilenoController.text,
        name: nameController.text,
        password: passwordController.text);

    Map<String, dynamic> data = dataUsers.tojson();
    String userdata = jsonEncode(data);
    sharedPreferences.setString('userdata', userdata);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: Expanded(
          child: ListView(scrollDirection: Axis.vertical, children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: size.height / 10, bottom: size.height / 30),
                    child: Text(
                      tr('sign'),
                      style: const TextStyle(
                          color: AppColors.gray600, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: size.height / 15,
                    ),
                    child: Text(tr('detailsSignup'),
                        style: const TextStyle(
                            color: AppColors.gray400, fontSize: 15)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 10),
                    child: CustomTextFormField(
                      textColor: AppColors.black,
                      backgroundColor: AppColors.gray300,
                      controller: nameController,
                      labeltext: tr('name'),
                      borderRaduis: 30,
                      keyboardType: TextInputType.text,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
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
                          return tr('name_required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width / 10, vertical: 10),
                      child: CustomTextFormField(
                        textColor: AppColors.black,
                        backgroundColor: AppColors.gray300,
                        controller: emailControlle,
                        labeltext: tr('email'),
                        borderRaduis: 35,
                        keyboardType: TextInputType.emailAddress,
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35)),
                            borderSide: BorderSide(color: Colors.blue)),
                        validator: (value) {
                          if (value?.isNotEmpty ?? false) {
                            if (!isValidEmail(value!)) {
                              return 'email is wrong';
                            }
                          } else {
                            return tr('email is required');
                          }
                          return null;
                        },
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 10),
                    child: CustomTextFormField(
                      maxLength: 10,
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: mobilenoController,
                      labeltext: tr('mobile'),
                      borderRaduis: 35,
                      keyboardType: TextInputType.phone,
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
                          return tr('number_phone_required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 10),
                    child: CustomTextFormField(
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: addreesController,
                      labeltext: tr('address'),
                      borderRaduis: 35,
                      keyboardType: TextInputType.streetAddress,
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
                          return tr('address_required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 10),
                    child: CustomTextFormField(
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: passwordController,
                      labeltext: tr('pas'),
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
                        if (value?.isNotEmpty ?? false) {
                          if (!isValidpassword(value!)) {}
                        } else {
                          return tr('password_is_required');
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 10),
                    child: CustomTextFormField(
                      textColor: AppColors.gray100,
                      backgroundColor: AppColors.gray300,
                      controller: confirmPasswordController,
                      labeltext: tr('confirm'),
                      borderRaduis: 35,
                      keyboardType: TextInputType.text,
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
                          return tr('password_confirmation');
                        }
                        return null;
                      },
                    ),
                  ),
                  CustomButton(
                      margin: EdgeInsets.only(
                          bottom: size.height / 20,
                          top: 10,
                          left: size.width / 9,
                          right: size.width / 9),
                      title: tr('sign'),
                      fontsize: 15,
                      fontWeight: FontWeight.w300,
                      backgroundColor: AppColors.orange,
                      textColor: AppColors.white,
                      onpressd: () {
                        if (formKey.currentState!.validate()) {
                          storeData();
                          if (confirmPasswordController.text ==
                              confirmPasswordController.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView(onMenuTap: () {})),
                            );
                          }
                        }
                      }),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginView()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(bottom: size.height / 20),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              tr('already'),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.gray400),
                            ),
                            Text(
                              tr('login'),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: AppColors.orange),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}
