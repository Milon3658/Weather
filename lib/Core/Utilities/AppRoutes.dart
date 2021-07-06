import 'package:get/get.dart';
import 'package:initial_app/Presentation/Pages/exportpages.dart';

import '../../main_page.dart';

class AppRoutes{
  static String INITIAL = "/";
  static String MAINPAGE = "mainPage";

  static List<GetPage> routes = [
    GetPage(name: INITIAL, page:() => SplashScreen(),),
    GetPage(name: MAINPAGE, page:() => MainPage(),),

  ];
}