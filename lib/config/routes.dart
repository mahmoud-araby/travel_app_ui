import 'package:flutter/cupertino.dart';
import 'package:travel_app_ui/ui/page/detail.dart';
import 'package:travel_app_ui/ui/page/home.dart';
import 'package:travel_app_ui/ui/page/main_page.dart';

class AppRouter {
  static Map<String, Widget Function(BuildContext)> routes = {
    Home.id: (context) => Home(),
    MainPage.id: (context) => MainPage(),
    Details.id: (context) => Details(),
  };
}
