import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/repository/login_repository.dart';
import '../utils/utils.dart';

class LoginViewModel extends GetxController{

  final  _api = LoginRepository();
  final emailController = TextEditingController(text: 'eve.holt@reqres.in').obs;
  final passwordController = TextEditingController().obs;

  RxBool passwordToggle = true.obs;

  RxBool changeButton = false.obs;

  RxBool loading = false.obs;


  setChangeButton(bool value){
    changeButton.value = value;
  }

  setPasswordToggle(bool value){
    passwordToggle.value = value;
  }


  final emailFocusNode =  FocusNode().obs;
  final passwordFocusNode =  FocusNode().obs;


  void loginApi(){
    loading.value = true;
    Map data = {
      'email' : emailController.value.text,
      'password': passwordController.value.text
    };
    _api.loginApi(data).then((value){
      loading.value = false;
        if(value['error'] != null){
          changeButton.value = false;
          Utils.snackErrorBar('Error', value['error'],);
        }else {
          changeButton.value = true;
          Utils.snackBar('Login', 'login successful');
        }
    }).onError((error, stackTrace){
      loading.value = false;
      Utils.snackBar('Error', error.toString());
    });
  }
}