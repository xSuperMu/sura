import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String data;
  final Color textColor;

  CustomText({
    required this.data,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: textColor,
      ),
    );
  }
}
