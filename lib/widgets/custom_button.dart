import 'package:flutter/material.dart';
import 'package:sura/widgets/custom_text.dart';

import '../themes/constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final double hight;
  final double width;
  final VoidCallback onPressed;
  CustomButton(
      {required this.label,
      required this.hight,
      required this.width,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: width,
      height: hight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: darkBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            )),
        child: CustomText(
          data: label,
          textColor: white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
