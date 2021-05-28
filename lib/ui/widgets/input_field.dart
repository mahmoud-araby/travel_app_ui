import 'package:flutter/material.dart';
import 'package:travel_app_ui/config/style.dart';

class AppInput extends StatelessWidget {
  final Function validator;
  final Function saver;
  final bool obscure;
  final Widget suffix;
  final String label;
  final TextEditingController controller;
  final Function onTap;
  final String initial;
  final TextInputType keyboardType;
  final String hint;
  final EdgeInsetsGeometry padding;
  final Widget prefixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      child: TextFormField(
        controller: controller,
        onTap: () {
          if (onTap != null) {
            onTap();
          }
        },
        initialValue: initial,
        keyboardType: keyboardType,
        obscureText: obscure,
        onSaved: saver,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          contentPadding: padding,
          prefixIcon: prefixIcon,
          suffix: suffix,
          fillColor: Style.white.withOpacity(0.5),
          filled: true,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          labelStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Style.white.withOpacity(0.5),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).errorColor),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  AppInput(
      {this.validator,
      this.saver,
      this.keyboardType,
      this.controller,
      this.padding,
      this.onTap,
      this.obscure = false,
      this.suffix,
      this.label,
      this.initial,
      this.hint,
      this.prefixIcon});
}
