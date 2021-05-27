import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_login/auth_controller.dart';
import 'package:getx_firebase_login/home/home_controller.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var authController = AuthController.to;

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("홈 뷰"),
              StreamBuilder(
                initialData: null,
                stream: authController.user,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      User user = snapshot.data as User;
                      var uid = user.uid;
                      return Container(child: SelectableText("사용자 UID \n$uid"));
                    }
                  }
                  return Container();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () => SelectableText(controller.token.value),
                ),
              ),
              TextButton(
                child: Text("Sign Out"),
                onPressed: authController.logout,
              )
            ],
          )),
        );
      },
    );
  }
}
