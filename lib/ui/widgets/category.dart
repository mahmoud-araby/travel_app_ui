import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/model/title_with_icon.dart';

class CategoryWidget extends StatelessWidget {
  final TitleOnly category;
  final AnimationController animationController;
  final Animation<double> animation;

  final Color color;
  final bool ok;
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
              0.0,
              100 * (1.0 - animation.value),
              0.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: 90,
                height: 80,
                decoration: BoxDecoration(
                  color: ok == true ? color : Style.KPrimaryColorLightMode,
                  borderRadius: BorderRadius.circular(14),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      category.icon,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      category.title,
                      style: TextStyle(color: Colors.white, fontSize: 14),
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

  CategoryWidget(this.category,
      {this.color, this.ok, this.animationController, this.animation});
}
