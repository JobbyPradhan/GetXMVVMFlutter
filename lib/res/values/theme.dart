import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/values/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
     // brightness: Brightness.dark,
      primarySwatch: Colors.deepOrange,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      disabledColor: AppColor.disableColor,
      canvasColor: creamColor,
      colorScheme: ThemeData().colorScheme.copyWith(secondary: AppColor.primaryButtonColor,
          onPrimary: darkBluishColor,
          onError: AppColor.redColor,
          onSurface: AppColor.primaryTextColor),

      /*
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
       */
      useMaterial3: true,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      ));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
   //   brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      colorScheme: ThemeData().colorScheme.copyWith(
        secondary: AppDarkColor.primaryButtonColor,
          onPrimary: lightBluishColor,
          onSurface: AppDarkColor.primaryTextColor,
          onError: AppColor.redColor,
      ),
      useMaterial3: true,
      //brightness: Brightness.dark),
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      ));

  //Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
}
