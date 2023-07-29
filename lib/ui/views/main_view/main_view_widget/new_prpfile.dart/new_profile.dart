import 'dart:convert';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_shopping/core/data/models/api/model_signup.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_button.dart';
import 'package:easy_shopping/ui/shared/custom_widget/custom_textformfield.dart';
import 'package:easy_shopping/ui/views/main_view/main_view_widget/home/home.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final namecontrolle = TextEditingController();
  final emailcontrolle = TextEditingController();
  final mobilenocontroller = TextEditingController();
  final addreescontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  File? selectedImage;

  Future<void> chooseImage(type) async {
    XFile? image = XFile('');

    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    if (image != null) {
      setState(() {
        selectedImage = File(image?.path ?? '');
      });
    }
  }

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
      Map<String, dynamic> mapJson = jsonDecode(sharedPreferences.getString(
          'userdata')!); //تم تحويل البيانات من جسون الى دارت ليفهمهمها الكلاس //

      DataUsers dataUsers = DataUsers.fromjson(mapJson);

      if (mapJson.isNotEmpty) {
        namecontrolle.value = TextEditingValue(text: dataUsers.name!);
        mobilenocontroller.value = TextEditingValue(text: dataUsers.mobileno!);
        addreescontroller.value = TextEditingValue(text: dataUsers.address!);
        emailcontrolle.value = TextEditingValue(text: dataUsers.email!);
        confirmpasswordcontroller.value =
            TextEditingValue(text: dataUsers.confirmpassword!);
        passwordcontroller.value = TextEditingValue(text: dataUsers.password!);
      }
    }
  }

  void storeData() {
    DataUsers dataUsers;

    dataUsers = DataUsers(
        address: addreescontroller.text,
        confirmpassword: confirmpasswordcontroller.text,
        email: emailcontrolle.text,
        mobileno: mobilenocontroller.text,
        name: namecontrolle.text,
        password: passwordcontroller.text);

    Map<String, dynamic> data = dataUsers.tojson();

    String userdata = jsonEncode(data);

    sharedPreferences.setString('userdata', userdata);

    //البيانات الي بالكلاس تم تحويلها الى جسون
    //تم انشاء متحول لاستخدامه في ( ملف شيرد) sharedلانه مابيفهم غير لغة الجسون
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //   bottomNavigationBar: const CustomNavigator(index: 3,),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height / 18, horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        tr('profile'),
                        style: const TextStyle(
                            color: AppColors.gray600, fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const Spacer(),
                      Image.asset(
                        'assets/images/shopping.png',
                        color: AppColors.gray600,
                      )
                    ],
                  ),
                ),
                Stack(alignment: AlignmentDirectional.center, children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: ClipOval(
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                  height: size.height / 3,
                                  width: size.width / 3,
                                )
                              : Image.asset(
                                  'assets/images/user.png',
                                  fit: BoxFit.cover,
                                  height: size.height / 3,
                                  width: size.width / 3,
                                )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height / 15),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Container(
                        width: size.width / 3.4,
                        height: size.height / 9.7, //////////////////////
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: const [
                                0.5,
                                0.1
                              ],
                              colors: [
                                AppColors.gray700.withOpacity(0.5),
                                AppColors.transparent
                              ]),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: (context),
                                builder: (context) {
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ListTile(
                                        leading: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minHeight: 50),
                                          child: const Icon(Icons.camera),
                                        ),
                                        title: const Text('image from camera'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          chooseImage("camera");
                                        },
                                      ),
                                      ListTile(
                                        leading: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              minHeight: 50),
                                          child: const Icon(Icons.photo),
                                        ),
                                        title: const Text('image from gallery'),
                                        onTap: () {
                                          Navigator.pop(context);

                                          chooseImage("gallery");
                                        },
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Image.asset(
                            'assets/images/camera.png',
                            color: AppColors.gray400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: size.height / 25,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 1),
                        child: Icon(
                          Icons.edit,
                          color: AppColors.orange,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 40,
                      ),
                      Text(
                        tr('edit_profile'),
                        style: const TextStyle(
                            fontSize: 10, color: AppColors.orange),
                      ),
                    ]),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    tr('hi'),
                    style: const TextStyle(
                        fontSize: 17,
                        color: AppColors.gray400,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  tr('sign_out'),
                  style:
                      const TextStyle(fontSize: 12, color: AppColors.gray400),
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 15, vertical: 10),
                        child: CustomTextFormField(
                          textColor: AppColors.black,
                          backgroundColor: AppColors.gray300,
                          controller: namecontrolle,
                          labeltext: tr('name'),
                          borderRaduis: 35,
                          keyboardType: TextInputType.text,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
                          errorBorder: OutlineInputBorder(
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
                              horizontal: size.width / 15, vertical: 10),
                          child: CustomTextFormField(
                            textColor: AppColors.black,
                            backgroundColor: AppColors.gray300,
                            controller: emailcontrolle,
                            labeltext: tr('email'),
                            borderRaduis: 35,
                            keyboardType: TextInputType.emailAddress,
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35)),
                                borderSide: BorderSide(color: Colors.blue)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                                borderSide: BorderSide.none),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none,
                            ),
                            validator: (value) {
                              if (value?.isNotEmpty ?? false) {
                                if (!isValidEmail(value!)) {
                                  return 'email is wrong';
                                }
                                return null;
                              } else {
                                return tr('email is required');
                              }
                            },
                          )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width / 15, vertical: 10),
                        child: CustomTextFormField(
                          maxLength: 10,
                          textColor: AppColors.gray100,
                          backgroundColor: AppColors.gray300,
                          controller: mobilenocontroller,
                          labeltext: tr('mobile'),
                          borderRaduis: 35,
                          keyboardType: TextInputType.phone,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: Colors.blue)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
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
                            horizontal: size.width / 15, vertical: 10),
                        child: CustomTextFormField(
                          textColor: AppColors.gray100,
                          backgroundColor: AppColors.gray300,
                          controller: addreescontroller,
                          labeltext: tr('address'),
                          borderRaduis: 35,
                          keyboardType: TextInputType.streetAddress,
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: Colors.blue)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide.none,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(35),
                              borderSide: BorderSide.none),
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
                            horizontal: size.width / 15, vertical: 10),
                        child: CustomTextFormField(
                          textColor: AppColors.gray100,
                          backgroundColor: AppColors.gray300,
                          controller: passwordcontroller,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
                              borderSide: BorderSide(color: Colors.blue)),
                          validator: (value) {
                            if (value?.isNotEmpty ?? false) {
                              if (!isValidpassword(value!)) {
                                return 'password is  wrong';
                              }
                            } else {
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35)),
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
                          title: tr('save'),
                          backgroundColor: AppColors.orange,
                          textColor: AppColors.white,
                          onpressd: () {
                            storeData();
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
              ]),
        )));
  }
}
