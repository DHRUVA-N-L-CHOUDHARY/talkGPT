import 'package:get/get.dart';
import 'package:talkgpt/src/views/chat_screen.dart';
import 'package:talkgpt/src/views/login_screen.dart';
import 'package:talkgpt/src/views/registration_screen.dart';
import 'package:talkgpt/src/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Paths.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Paths.REGISTER,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Paths.LOGIN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Paths.CHAT,
      page: () => ChatScreen(),
    ),
  ];
}
