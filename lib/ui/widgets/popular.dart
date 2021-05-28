import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';
import 'package:travel_app_ui/model/title_with_icon.dart';

class PopularWidget extends StatelessWidget {
  final TitleOnly category;
  final Color color;
  final bool ok;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Container(
                width: 200,
                height: 80,
                decoration: BoxDecoration(
                  color: ok == true ? color : Style.KPrimaryColorLightMode,
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(category.icon),
                  ),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      category.title,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  PopularWidget(this.category,
      {this.color, this.ok, this.animationController, this.animation});
}
