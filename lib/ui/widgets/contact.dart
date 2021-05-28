import 'package:flutter/material.dart';
import 'package:travel_app_ui/model/title_with_icon.dart';

class ContactWidget extends StatelessWidget {
  final TitleOnly category;

  final Color color;
  final bool ok;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            category.icon,
            height: 24,
            width: 24,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            category.title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  ContactWidget(this.category, {this.color, this.ok});
}
