import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/values/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 100,
    this.height = 50,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(50)),
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : InkWell(
                onTap: onPress,
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: context.theme.colorScheme.onSurface),
                  ),
                ),
              ));
  }
}

class SquareButton extends StatelessWidget {
  const SquareButton({
    Key? key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryTextColor,
    required this.title,
    required this.onPress,
    this.width = 100,
    this.height = 50,
    this.success = false,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final bool success;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return Material(
        color: loading ? Colors.transparent : context.theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(success ? 50 : 8.0),
        child: loading
            ? const CircularProgressIndicator()
            : InkWell(
                onTap: onPress,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  width: success ? 50 : width,
                  height: height,
                  alignment: Alignment.center,
                  child: success
                      ? const Icon(Icons.done)
                      : const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                ),
              ));
  }
}
