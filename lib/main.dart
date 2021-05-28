import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_ui/ui/page/home.dart';

import 'config/routes.dart';
import 'config/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final locales = [
    Locale("ar", "EG"),
    Locale("en", "US"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      initialRoute: Home.id,
      routes: AppRouter.routes,
      theme: Style.customTheme(),
      supportedLocales: locales,
      themeMode: ThemeMode.light,
      locale: Locale('en', 'US'),
    );
  }
}
