import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/app_exception.dart';
import 'package:getx_mvvm/res/assets/images_assets.dart';
import 'package:getx_mvvm/res/components/internet_checking_widget.dart';
import 'package:getx_mvvm/res/fonts/app_font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.welcomeScreen), fit: BoxFit.cover),
        ),
        child:  Center(
          child: Text(
            'Welcome',
            style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 34, color: context.theme.colorScheme.onSurface
            ),
          ),
        ),
    );

  /*   */

    /*Container(
          height: height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.welcomeScreen),
                fit: BoxFit.contain),
          ),
    );*/
  }
}
