import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  @override
  void onReady() {
    ever(firebaseUser, handleAuthChanged);
    firebaseUser.bindStream(user);
    super.onReady();
  }

  Stream<User?> get user => _auth.authStateChanges();

  handleAuthChanged(_firebaseUser) {
    if (_firebaseUser == null) {
      Get.offAllNamed("/login");
    } else {
      Get.offAllNamed("/home");
    }
  }

  /// 임의로 익명 로그인을 함
  loginWithAnonymous() => _auth.signInAnonymously();
  logout() => _auth.signOut();
}
