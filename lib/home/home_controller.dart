import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var token = "".obs;
  @override
  void onReady() {
    print("HOME CONTROLLER INIT");
    FirebaseMessaging.instance.getToken().then((value) {
      token.value = value!;
    }).catchError((error) {
      print(error);
      token.value = "FCM 토큰을 가져오는데 문제가 있음";
    });
    super.onReady();
  }
}
