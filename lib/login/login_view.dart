import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_login/auth_controller.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: AuthController.to,
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("로그인 뷰"),
                ElevatedButton(
                  child: Text("로그인"),
                  onPressed: controller.loginWithAnonymous,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
