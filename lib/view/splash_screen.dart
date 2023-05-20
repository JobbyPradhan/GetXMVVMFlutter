import 'package:flutter/material.dart';
import 'package:getx_mvvm/data/app_exception.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("Welcome"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         throw InternetException();
      },
      ),
    );
  }
}
