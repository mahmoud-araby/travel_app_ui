import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/ui/page/main_page.dart';
import 'package:travel_app_ui/ui/page/test.dart';

import 'center.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  static String id = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageIndex = 0;
  PageController pageController;

  onPageChange(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  goToPage(int page) {
    pageController.animateToPage(page,
        duration: Duration(seconds: 1, milliseconds: 500), curve: Curves.ease);
  }

  Widget buildMainScreen() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75.0),
        child: PageView(
          controller: pageController,
          onPageChanged: onPageChange,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            MainPage(),
            Container(),
            CenterPage(),
            Test(),
            Details(),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              30,
            ),
          ),
          color: Style.KAccentColorLightMode,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              30,
            ),
          ),
          child: CupertinoTabBar(
            backgroundColor: Style.KPrimaryColorLightMode,
            activeColor: Style.green,
            currentIndex: pageIndex,
            onTap: (value) {
              print(value);
              goToPage(value);
            },
            // selectedItemColor: Style.green,
            // selectedIconTheme: IconThemeData(color: Style.green),
            // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            // unselectedItemColor: Colors.grey.shade600,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: SvgPicture.asset(
                  "assets/icons/1.svg",
                  height: 20,
                  width: 20,
                  color: pageIndex == 0 ? Colors.white : Colors.white12,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: SvgPicture.asset(
                  "assets/icons/2.svg",
                  height: 20,
                  width: 20,
                  color: pageIndex == 1 ? Colors.white : Colors.white12,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/3.svg",
                      height: 90,
                      width: 90,
                      color: pageIndex == 2 ? null : Colors.white12,
                    ),
                    if (pageIndex != 2)
                      Image.asset(
                        "assets/icons/3-overlay.png",
                        height: 20,
                        width: 20,
                        color: Color(0xffC7A780),
                      ),
                  ],
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: SvgPicture.asset(
                  "assets/icons/4.svg",
                  height: 20,
                  width: 20,
                  color: pageIndex == 3 ? Colors.white : Colors.white12,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                icon: SvgPicture.asset(
                  "assets/icons/5.svg",
                  height: 20,
                  width: 20,
                  color: pageIndex == 4 ? Colors.white : Colors.white12,
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildMainScreen();
  }
}
