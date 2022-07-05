import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sura/themes/constants.dart';

class TextFormFieldCustom extends StatelessWidget {
  final String inputText;
  final IconData icon;

  const TextFormFieldCustom({required this.inputText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: inputText,
              filled: true,
              fillColor: grey,
              suffixIcon: IconButton(
                  icon: Icon(icon),
                  //do somthing
                  onPressed: () {}),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
        ));
  }
}
