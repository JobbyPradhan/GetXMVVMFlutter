import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/assets/images_assets.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/res/values/colors.dart';
import 'package:getx_mvvm/res/values/string.dart';
import 'package:getx_mvvm/view_models/login_viewmodel.dart';

import '../utils/utils.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({Key? key}) : super(key: key);

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final loginViewModel = Get.put(LoginViewModel());
  bool passToggle = true;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      // loginViewModel.setChangeButton(true);
      loginViewModel.loginApi();
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      //loginViewModel.setChangeButton(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageAssets.loginBg,
                fit: BoxFit.cover,
                width: width * 1,
                height: height * 0.35,
              ),
              const SizedBox(
                height: 20.0,
              ),
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: ' Welcome',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: ' Bookie!',
                        style: TextStyle(
                            fontSize: 28,
                            color: AppColor.greenColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLanguage.loginNote,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "example@gmail.com",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: AppColor.blackLightColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter UserName";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _formKey.currentState!.validate();
                      },
                      controller: loginViewModel.emailController.value,
                      focusNode: loginViewModel.emailFocusNode.value,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                            context,
                            loginViewModel.emailFocusNode.value,
                            loginViewModel.passwordFocusNode.value);
                      },
                    ),
                    const SizedBox(height: 16),
                    Obx(() {
                      return TextFormField(
                        obscureText: loginViewModel.passwordToggle.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: AppColor.blackLightColor,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5.5),
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                passToggle =
                                    loginViewModel.passwordToggle.value;
                                loginViewModel.setPasswordToggle(!passToggle);
                              },
                              child: Icon(
                                loginViewModel.passwordToggle.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              )),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Password";
                          } else if (value.length < 6) {
                            return "Password length should be at least 6.";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _formKey.currentState!.validate();
                        },
                        controller: loginViewModel.passwordController.value,
                        focusNode: loginViewModel.passwordFocusNode.value,
                        onFieldSubmitted: (value) {
                          //Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
                        },
                      );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Obx(() {
                      return SquareButton(
                        title: "Login",
                        onPress: () {
                          moveToHome(context);
                        },
                        success: loginViewModel.changeButton.value,
                        loading: loginViewModel.loading.value,
                        width: width * 1,
                      );
                    }),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      AppLanguage.loginWith,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: width * 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageAssets.icGoogle,
                            height: 60,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Image.asset(
                            ImageAssets.icFb,
                            height: 70,
                            width: 60,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Image.asset(
                            ImageAssets.icApple,
                            height: 60,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'New User?',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                              text: ' Register Here!',
                              style: TextStyle(
                                  color: AppColor.greenColor,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
