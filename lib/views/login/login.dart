/*
 * @Author       : djkloop
 * @Date         : 2020-06-19 01:10:31
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-19 02:15:30
 * @Description  : 头部注释
 * @FilePath     : /todo_list/lib/views/login/login.dart
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_vant_kit/main.dart';

/// viewmodel
import 'package:todo_list/view_models/login/login_view_model.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginViewModel>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CellGroup(
            children: <Widget>[
              Field(
                label: "用户名",
                controller: provider.usernameController,
                placeholder: "请输入用户名",
              ),
              Field(
                label: "密码",
                placeholder: "请输入密码",
                error: provider.showRequiredPasswordError,
                errorMessage:
                    provider.showRequiredPasswordError ? "密码不能为空" : "",
                controller: provider.passwordController,
                require: true,
                onChange: provider.passwordTextFieldValue,
                type: "password",
              ),
              NButton(
                text: provider.state == 0
                    ? "登录"
                    : provider.state == 1
                        ? "登录中..."
                        : provider.state == 2 ? "登录成功" : "登录",
                type: "info",
                plain: true,
                loading: provider.state == 1,
                disabled: provider.state == 1,
                onClick: provider.login,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
