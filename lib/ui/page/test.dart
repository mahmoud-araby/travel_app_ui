import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/ui/widgets/button.dart';
import 'package:travel_app_ui/ui/widgets/header_delegate.dart';

class Test extends StatefulWidget {
  static String id = '/Test';

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  AnimationController dataController;
  bool action = false;
  ScrollController controller = ScrollController();

  Widget buildMainScreen() {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: action
          ? FloatingActionButton(
              onPressed: () {
                controller.animateTo(0,
                    duration: Duration(seconds: 1), curve: Curves.ease);
              },
              backgroundColor: Style.green,
              child: Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
              ),
            )
          : null,
      body: CustomScrollView(
        controller: controller,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            delegate:
                HeaderDelegate(MediaQuery.of(context).size.height * 0.45, 200),
            pinned: true,
          ),
          list(
            0,
            dataController,
            Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: dataController,
                curve: Interval((1 / 9) * 1, 1.0, curve: Curves.easeIn),
              ),
            ),
          ),
          list(
            1,
            dataController,
            Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: dataController,
                curve: Interval((1 / 9) * 3, 1.0, curve: Curves.easeIn),
              ),
            ),
          ),
          list(
            2,
            dataController,
            Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: dataController,
                curve: Interval((1 / 9) * 6, 1.0, curve: Curves.easeIn),
              ),
            ),
          ),
          list(
            3,
            dataController,
            Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: dataController,
                curve: Interval((1 / 9) * 9, 1.0, curve: Curves.easeIn),
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
    );
  }

  @override
  void initState() {
    dataController =
        AnimationController(duration: new Duration(seconds: 2), vsync: this);
    controller.addListener(() {
      if (controller.position.pixels > 100) {
        setState(() {
          action = true;
        });
      }
      if (controller.position.pixels < 100) {
        setState(() {
          action = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildMainScreen();
  }

  list(int index, animationController, animation) {
    animationController.forward();
    return SliverList(
        delegate: SliverChildListDelegate([
      AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                0.0,
                200 * (animation.value - 1),
                0.0,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            "Overview",
                            Color(0xffC7A780),
                          ),
                        ),
                        Expanded(
                          child: AppButton(
                            "Review",
                            Color(0xff4B505D),
                          ),
                        ),
                        Expanded(
                          child: AppButton(
                            "Futures",
                            Color(0xff4B505D),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Your all-in-one travel app",
                      style: TextStyle(color: Color(0xffC7A780), fontSize: 28),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "Book flights, hotels, trains & rental cars anywhere in the world in just seconds. Get real-time flight updates, travel info, exclusive deals, and 30% more Trip Coins only on the app, trains & rental cars anywhere in the world.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.5,
                          height: 1.5,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Text(
                      "See Full Description",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_sharp,
                          color: Color(0xff828282),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Open (04:00PM)",
                          style: TextStyle(
                            color: Color(0xff828282),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Icon(
                          Icons.access_time_sharp,
                          color: Color(0xff828282),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Close (11:00PM)",
                          style: TextStyle(
                            color: Color(0xff828282),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    ]));
  }
}
