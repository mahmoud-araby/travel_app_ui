import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 43,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45), color: color),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  AppButton(this.text, this.color);
}
