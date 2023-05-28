import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes.dart';
import 'package:getx_mvvm/res/values/language.dart';
import 'package:getx_mvvm/res/values/theme.dart';
import 'package:getx_mvvm/view/login_screen.dart';
import 'package:getx_mvvm/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: Language(),
      debugShowCheckedModeBanner: false,
      locale: const Locale('en' , 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const LoginPages(),
      getPages: AppRoutes.appRoutes(),
    );
  }
}
