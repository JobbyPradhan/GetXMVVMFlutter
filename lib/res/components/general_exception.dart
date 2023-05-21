import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/values/colors.dart';
import 'package:getx_mvvm/res/values/string.dart';

class GeneralExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralExceptionWidget({Key? key,required this.onPress}) : super(key: key);

  @override
  State<GeneralExceptionWidget> createState() =>
      _GeneralExceptionWidgetState();
}

class _GeneralExceptionWidgetState extends State<GeneralExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * .01,
            ),
            Icon(
              Icons.cloud_off,
              color: context.theme.colorScheme.onError,
            ),
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(AppLanguage.noInternet)),
            SizedBox(
              height: height * .01,
            ),
            InkWell(
              onTap: widget.onPress,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: context.theme.colorScheme.secondary,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Retry',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: context.theme.colorScheme.onSurface
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
