import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/data/test_data.dart';
import 'package:travel_app_ui/ui/widgets/contact.dart';

class HeaderDelegate implements SliverPersistentHeaderDelegate {
  final double appMaxHeight;
  final double appMinHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constrains) => Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        30.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Travel App",
                          style: TextStyle(
                              fontSize: 40,
                              color: Style.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Style.actionColor,
                            borderRadius: BorderRadius.circular(180),
                          ),
                          child: IconButton(
                            iconSize: 13,
                            icon: Image.asset(
                              "assets/icon.png",
                              height: 20.0,
                              width: 20.0,
                            ),
                            color: Style.inputColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (constrains.smallest.height > -1)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Style.KPrimaryColorLightMode,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                  child: ContactWidget(TestData.contacts[0])),
                              Expanded(
                                  child: ContactWidget(TestData.contacts[1])),
                              Expanded(
                                  child: ContactWidget(TestData.contacts[2])),
                              Expanded(
                                  child: ContactWidget(TestData.contacts[3])),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => appMaxHeight;

  @override
  double get minExtent => appMinHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;

  HeaderDelegate(this.appMaxHeight, this.appMinHeight);
}

class TestDelegate implements SliverPersistentHeaderDelegate {
  final double appMaxHeight;
  final double appMinHeight;
  double percentage;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      percentage = (constraints.maxHeight - appMinHeight) /
          (appMaxHeight - appMinHeight);
      print(percentage);
      print(constraints.maxHeight);
      print(minExtent);
      print(maxExtent);
      print(appMaxHeight);
      return Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(
                        30.0,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/background.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Travel App",
                          style: TextStyle(
                              fontSize: 40,
                              color: Style.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Style.actionColor,
                            borderRadius: BorderRadius.circular(180),
                          ),
                          child: IconButton(
                            iconSize: 13,
                            icon: Image.asset(
                              "assets/icon.png",
                              height: 20.0,
                              width: 20.0,
                            ),
                            color: Style.inputColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (percentage > 0.2)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5),
                      child: Opacity(
                        opacity: percentage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Style.KPrimaryColorLightMode,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                    child: ContactWidget(TestData.contacts[0])),
                                Expanded(
                                    child: ContactWidget(TestData.contacts[1])),
                                Expanded(
                                    child: ContactWidget(TestData.contacts[2])),
                                Expanded(
                                    child: ContactWidget(TestData.contacts[3])),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  @override
  double get maxExtent => appMaxHeight;

  @override
  double get minExtent => appMinHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration get showOnScreenConfiguration =>
      null;

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;

  @override
  TickerProvider get vsync => null;

  TestDelegate(this.appMaxHeight, this.appMinHeight);
}
