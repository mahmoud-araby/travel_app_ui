import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/model/data_with_icon.dart';

class DataWidget extends StatelessWidget {
  final Data data;
  final AnimationController animationController;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    animationController.forward();
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
              200 * (animation.value - 1),
              0.0,
              0.0,
            ),
            child: SizedBox(
              height: 70,
              width: 210,
              child: Container(
                height: 70,
                padding: EdgeInsets.only(right: 15),
                child: Row(
                  children: [
                    Image.asset(
                      data.icon,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            data.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.subTitle,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.remove_red_eye_outlined,
                                color: Style.green,
                                size: 17,
                              ),
                              Text(
                                data.view.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                              SizedBox(
                                width: 9,
                              ),
                              Icon(
                                Icons.clean_hands_outlined,
                                color: Style.green,
                                size: 17,
                              ),
                              Text(
                                data.likes.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  DataWidget(this.data, {this.animationController, this.animation});
}
