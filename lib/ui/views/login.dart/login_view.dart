import 'dart:collection';
import 'dart:convert';
import 'package:easy_shopping/app/my_app.dart';
import 'package:easy_shopping/core/data/repositories/shared_prefrence_repository.dart';
import 'package:easy_shopping/core/services/location_service.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/shared/utils.dart';
import 'package:easy_shopping/ui/views/create.dart/create_view.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:easy_shopping/ui/views/login.dart/login_controller.dart';
import 'package:easy_shopping/ui/views/reset_password.dart/reset_password_view.dart';
import 'package:easy_shopping/ui/views/whats_app.dart/whats_app.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // TextEditingController passwordControlle = TextEditingController();
  // TextEditingController emailController = TextEditingController();

  // final formKey = GlobalKey<FormState>();
  // LoginController contoller = Get.put(LoginController());
  LoginController contoller = Get.put(LoginController());
  // @override
  // void dispose() {
  //   passwordControlle.dispose();
  //   emailController.dispose();
  //   super.dispose();
  // }

  late SharedPreferences sharedPreferences;
  
 

  @override
  void initState() {
    super.initState();
    // تعيد شكل الصفحة حسب البيانات المحفوظة//??
    // initalGetSavedData();
  }

  // void initalGetSavedData() async {
  //   sharedPreferences =
  //       await SharedPreferences.getInstance(); //build sharedprefrence//

  //   if (sharedPreferences.getString('logo') != null) {
  //     Map<String, dynamic> personal =
  //         jsonDecode(sharedPreferences.getString('logo')!);

  //     Login login = Login.fromjson(personal);
  //     if (personal.isNotEmpty) {
  //       passwordControlle.value = TextEditingValue(text: login.password!);
  //       emailController.value = TextEditingValue(text: login.email!);
  //     }
  //   }
  // }

  // void storData() {
  //   Login user;
  //   user = Login(
  //     password: passwordControlle.text,
  //     email: emailController.text,
  //   );

  //   String logo = jsonEncode(user);
  //   sharedPreferences.setString('logo', logo);
  // }

//?  controller.isLogin.value;??منحطها بدل كل isLogin
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
              child: Form(
            key: contoller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      Get.defaultDialog(
                          title: tr("key_login"),
                          content: Column(
                            children: [
                              InkWell(
                                  onTap: () {
                                    SharedPrefrenceRepository()
                                        .setAppLang('en');
                                    Get.updateLocale(getLocal());
                                  },
                                  child: const Text("English")),
                              InkWell(
                                  onTap: () {
                                    SharedPrefrenceRepository()
                                        .setAppLang('ar');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: const Text("العربية")),
                              InkWell(
                                  onTap: () {
                                    SharedPrefrenceRepository()
                                        .setAppLang('tr');
                                    Get.updateLocale(getLocal());
                                    Get.back();
                                  },
                                  child: const Text("Turcis")),
                            ],
                          ));
                    },
                    child: const Icon(Icons.language)),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height / 8, bottom: 10),
                    child: Text(
                      tr('login'),
                      style: const TextStyle(
                          fontSize: 30, color: AppColors.gray600),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    tr('add'),
                    style:
                        const TextStyle(fontSize: 15, color: AppColors.gray400),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: size.width / 10,
                    right: size.width / 10,
                    top: size.height / 15,
                  ),
                  child: CustomTextFormField(
                    controller: contoller.emailController,
                    labeltext: tr('your'),
                    textColor: AppColors.gray100,
                    backgroundColor: AppColors.gray300,
                    borderRaduis: 35,
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
                  padding: EdgeInsets.only(
                      left: size.width / 10,
                      right: size.width / 10,
                      top: size.height / 30),
                  child: CustomTextFormField(
                      controller: contoller.passwordController,
                      labeltext: tr('pas'),
                      textColor: AppColors.gray100,
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
                          return tr('password_is_required');
                        }
                        return null;
                      }),
                ),
                Obx(() {
                  return contoller.isLoading.value
                      ? const SpinKitThreeBounce(
                          color: AppColors.orange400,
                        )
                      : CustomButton(
                          title: 'Login',
                          backgroundColor: AppColors.orange400,
                          onpressd: () {
                            contoller.login();
                   //           Get.to(MapView());
                            Get.to(HomeView(onMenuTap: () {}));
                          },
                        );
                }),
                CustomButton(
                  //     width: 200,
                  title: 'Add Location',
                  padding: EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  backgroundColor: Colors.green.shade300,
                  onpressd: () async {
                  LocationService().getUserCurrentLocation();
                 
                    // Location location = new Location();

                    // bool _serviceEnabled;
                    // PermissionStatus _permissionGranted;
                    // LocationData _locationData;

                    // _serviceEnabled = await location.serviceEnabled();
                    // if (!_serviceEnabled) {
                    //   _serviceEnabled = await location.requestService();
                    //   if (!_serviceEnabled) {
                    //     return;
                    //   }
                    // }

                    // _permissionGranted = await location.hasPermission();
                    // if (_permissionGranted == PermissionStatus.denied) {
                    //   _permissionGranted = await location.requestPermission();
                    //   if (_permissionGranted != PermissionStatus.granted) {
                    //     return;
                    //   }
                    // }

                    // _locationData = await location.getLocation();
                  },
                )
                //        CustomButton(
                // margin: EdgeInsets.only(
                //     left: size.width / 10,
                //     right: size.width / 10,
                //     top: size.height / 30),
                // title: tr('login'),
                // // fontsize: 16,
                // // fontWeight: FontWeight.w300,
                // backgroundColor: AppColors.orange400,
                // textColor: AppColors.white,
                // onpressd: () {
                //   if (formKey.currentState!.validate()) {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) =>  Home(onMenuTap: (){},)),
                //     );
                //     // storData();
                //     // for (int i = 0; i <= Login.user.length; i++) {
                //     //   if (emailController.text == Login.user[i].email &&
                //     //       passwordControlle.text ==
                //     //           Login.user[i].password) {
                //     //     Navigator.push(
                //     //       context,
                //     //       MaterialPageRoute(
                //     //           builder: (context) => const Home()),
                //     //     );
                //     //   }
                //     // }
                //   }
                // }),
//??طريقة استدعاء  login مع stateManegment//
                ,
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: size.height / 25,
                      start: size.width / 3.7,
                      bottom: size.height / 25),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPasswordView()),
                            );
                          },
                          child: Text(
                            tr('forget'),
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.gray400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height / 20,
                          ),
                          child: Text(
                            tr('or'),
                            style: const TextStyle(
                                fontSize: 13, color: AppColors.gray400),
                          ),
                        ),
                      ]),
                ),
                CustomButton(
                  margin: EdgeInsets.only(
                      left: size.width / 10,
                      right: size.width / 10,
                      bottom: size.height / 30),
                  title: tr('loginw'),
                  image: Image.asset(
                    'assets/images/facebook.png',
                    color: AppColors.white,
                  ),
                  fontsize: 12,
                  fontWeight: FontWeight.w300,
                  onpressd: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  backgroundColor: AppColors.blue200,
                  textColor: AppColors.white,
                ),
                CustomButton(
                  margin: EdgeInsets.only(
                      left: size.width / 10,
                      right: size.width / 10,
                      bottom: size.height / 30),
                  title: tr('loginwi'),
                  image: Image.asset(
                    'assets/images/images.jpg',
                    width: 15,
                    height: 15,
                  ),
                  fontsize: 12,
                  fontWeight: FontWeight.w300,
                  onpressd: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  ),
                  backgroundColor: AppColors.red200,
                  textColor: AppColors.white,
                ),
                CustomButton(
                  margin: EdgeInsets.only(
                      left: size.width / 10,
                      right: size.width / 10,
                      bottom: size.height / 30),
                  title: tr('conect'),
                  image: Image.asset(
                    'assets/images/whats.png',
                    color: AppColors.white,
                  ),
                  fontsize: 12,
                  fontWeight: FontWeight.w300,
                  onpressd: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WhatsApp()),
                  ),
                  backgroundColor: AppColors.green,
                  textColor: AppColors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height / 8, bottom: size.height / 20),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          tr('dont'),
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.gray400),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateView()),
                            );
                          },
                          child: Text(
                            tr('sign'),
                            style: const TextStyle(
                                fontSize: 15,
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          )),
        ));
  }
}
