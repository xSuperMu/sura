import 'package:flutter/material.dart';

import '../themes/constants.dart';
import 'custom_text.dart';

class CustomPage extends StatelessWidget {
  final String imgPath;
  final String text;

  CustomPage({
    required this.imgPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var black2 = black;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          width: size.width * 0.7,
          height: size.height * 0.6,
          fit: BoxFit.contain,
          image: AssetImage(imgPath),
        ),
        Flexible(
            child: CustomText(
          data: text,
          textColor: black,
        )),
      ],
    );
  }
}
