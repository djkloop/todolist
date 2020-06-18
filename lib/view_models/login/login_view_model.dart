/*
 * @Author       : djkloop
 * @Date         : 2020-06-19 01:12:48
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-19 02:19:21
 * @Description  : 头部注释
 * @FilePath     : /todo_list/lib/view_models/login/login_view_model.dart
 */
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:oktoast/oktoast.dart';

/// model
import 'package:todo_list/models/login/login_model.dart';

class LoginViewModel extends ChangeNotifier {
  final loginModel = LoginModel();
  int state = 0;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showRequiredPasswordError = false;

  isEmptyName(String text) {
    if (text == null || text == "") {
      showRequiredPasswordError = true;
    } else {
      showRequiredPasswordError = false;
    }
  }

  passwordTextFieldValue(String text) {
    passwordController.text = text;
    isEmptyName(text);
    notifyListeners();
  }

  login() {
    final data = {
      "username": usernameController.text,
      "password": passwordController.text,
    };

    if (passwordController.text == null || passwordController.text == "") {
      isEmptyName(passwordController.text);
      showToast("密码不能为空啊！");
      return;
    }

    if (state != 0) return;

    loginModel.login(data).doOnListen(() {
      state = 1;
      notifyListeners();
    }).listen((v) {
      if (v != 0) {
        state = 3;
        notifyListeners();
        Future.delayed(Duration(seconds: 5), () {
          state = 0;
          notifyListeners();
        });
      } else {
        state = 2;
        notifyListeners();
        Future.delayed(Duration(seconds: 1), () {
          state = 0;
          notifyListeners();
        });
      }
    });
  }
}
