import 'package:get/get.dart';
import 'package:getx_firebase_login/home/home_view.dart';
import 'package:getx_firebase_login/loading/loading_view.dart';
import 'package:getx_firebase_login/login/login_view.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: "/", page: () => LoadingView()),
    GetPage(name: "/home", page: () => HomeView()),
    GetPage(name: "/login", page: () => LoginView())
  ];
}
