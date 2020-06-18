/*
 * @Author       : djkloop
 * @Date         : 2020-06-19 00:30:13
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-19 02:08:43
 * @Description  : 头部注释
 * @FilePath     : /todo_list/lib/main.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';

///
import 'package:todo_list/view_models/login/login_view_model.dart';
import 'package:todo_list/views/login/login.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter MVVM Demo',
        home: ChangeNotifierProvider(
          create: (_) => LoginViewModel(),
          child: LoginPage(),
        ),
      ),
    );
  }
}
