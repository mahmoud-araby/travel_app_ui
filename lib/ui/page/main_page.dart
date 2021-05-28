import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/data/test_data.dart';
import 'package:travel_app_ui/ui/widgets/category.dart';
import 'package:travel_app_ui/ui/widgets/data.dart';
import 'package:travel_app_ui/ui/widgets/input_field.dart';
import 'package:travel_app_ui/ui/widgets/popular.dart';

class MainPage extends StatefulWidget {
  static String id = '/MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  AnimationController popularController;
  AnimationController categoryController;
  AnimationController dataController;
  ScrollController scrollController = ScrollController();
  Widget buildMainScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
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
                                      image:
                                          AssetImage("assets/background.png"),
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 15.0, left: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                            Container(
                              child: Column(
                                children: [
                                  AppInput(
                                    label: "What are you looking for ?",
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    height: 90,
                                    padding: EdgeInsets.only(left: 15),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: TestData.category.length,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          CategoryWidget(
                                        TestData.category[index],
                                        animationController: categoryController,
                                        animation:
                                            Tween<double>(begin: 0.0, end: 1.0)
                                                .animate(
                                          CurvedAnimation(
                                            parent: categoryController,
                                            curve: Interval(
                                                (1 / TestData.category.length) *
                                                    index,
                                                1.0,
                                                curve: Curves.fastOutSlowIn),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 28)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Popular Attractions",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "see All",
                        style: TextStyle(
                          color: Color(0xffC7A780),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.popular.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => PopularWidget(
                      TestData.popular[index],
                      animationController: popularController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: popularController,
                          curve: Interval(
                              (1 / TestData.popular.length) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 15)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 90,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.data.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => DataWidget(
                      TestData.data[index],
                      animationController: dataController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: dataController,
                          curve: Interval(
                              (1 / TestData.data.length) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 28)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Popular Attractions",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "see All",
                        style: TextStyle(
                          color: Color(0xffC7A780),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.popular.length,
                    physics: PageScrollPhysics(),
                    itemBuilder: (context, index) => PopularWidget(
                      TestData.popular[index],
                      animationController: popularController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: popularController,
                          curve: Interval(
                              (1 / TestData.popular.length) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 15)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 90,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.data.length,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) => DataWidget(
                      TestData.data[index],
                      animationController: dataController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: dataController,
                          curve: Interval(
                              (1 / TestData.data.length) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 28)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Popular Attractions",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "see All",
                        style: TextStyle(
                          color: Color(0xffC7A780),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  height: 120,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.popular.length,
                    physics: RangeMaintainingScrollPhysics(),
                    itemBuilder: (context, index) => PopularWidget(
                      TestData.popular[index],
                      animationController: popularController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: popularController,
                          curve: Interval(
                              (1 / TestData.popular.length) * index, 1.0,
                              curve: Curves.easeIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 15)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 90,
                  padding: EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: TestData.data.length,
                    physics: RangeMaintainingScrollPhysics(),
                    itemBuilder: (context, index) => DataWidget(
                      TestData.data[index],
                      animationController: dataController,
                      animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: dataController,
                          curve: Interval(
                              (1 / TestData.data.length) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 35)),
        ],
      ),
      extendBody: true,
    );
  }

  @override
  void initState() {
    scrollController.addListener(() {
      print(scrollController.position.pixels);
      if (scrollController.position.pixels > 147 &&
          scrollController.position.pixels < 148) {
        popularController.forward();
      }
    });

    popularController =
        AnimationController(duration: new Duration(seconds: 6), vsync: this);
    dataController =
        AnimationController(duration: new Duration(seconds: 4), vsync: this);
    categoryController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    popularController.dispose();
    categoryController.dispose();
    dataController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildMainScreen();
  }
}
