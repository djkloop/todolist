/*
 * @Author       : djkloop
 * @Date         : 2020-06-19 01:25:10
 * @LastEditors  : djkloop
 * @LastEditTime : 2020-06-19 02:13:13
 * @Description  : 头部注释
 * @FilePath     : /todo_list/lib/models/login/login_model.dart
 */

class LoginModel {
  Stream<int> login(dynamic data) => Stream.fromFuture(
        Future.delayed(
          Duration(seconds: 2),
          () {
            if (data["username"] == "djkloop" && data["password"] == "123") {
              return 0;
            }
            return 1;
          },
        ),
      );
}
