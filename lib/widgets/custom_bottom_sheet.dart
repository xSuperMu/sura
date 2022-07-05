import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../themes/constants.dart';
import 'custom_textFormField.dart';




class BottomSheetCostimize extends StatelessWidget {
  const BottomSheetCostimize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
 
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: DraggableScrollableSheet(
                //initialChildSize: 0.5,

                maxChildSize: 0.8,
                // maxChildSize: 0.85,
                builder: (BuildContext ctx, ScrollController ScrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        controller: ScrollController,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(children: [
                                SizedBox(
                                  width: 50,
                                  child: Divider(
                                    thickness: 5,
                                    color: Colors.amber,
                                  ),
                                ),
                              ]),
                            );
                          }

                          return Container(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(children: [

                                TextFormFieldCustom( inputText: ' موقع البداية ',   icon: Icons.edit   ),
                                SizedBox(  height: 20),

                              ]),
                            ),
                          );
                        }),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
