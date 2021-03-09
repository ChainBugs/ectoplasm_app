import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final ButtonStyle style;

  AppButton({this.text = "Click me!", this.onPressed, this.style});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPressed,
      style: style,
    );
  }
}
