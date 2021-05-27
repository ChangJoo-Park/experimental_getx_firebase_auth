import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var token = "".obs;
  @override
  void onReady() {
    print("HOME CONTROLLER INIT");
    FirebaseMessaging.instance.getToken().then((value) => token.value = value!);
    super.onReady();
  }
}
