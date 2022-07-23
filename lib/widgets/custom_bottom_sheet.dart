import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';


import 'package:sura/widgets/custom_button.dart';

import '../models/providers/control_provider.dart';
import '../themes/constants.dart';
import 'custom_textFormField.dart';

class BottomSheetCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final locations = context.watch<DataProvider>().locations;

    return DraggableScrollableSheet(
      // initialChildSize: 0.08,
      minChildSize: 0.5,
      maxChildSize: 0.85,
      builder: (BuildContext ctx, ScrollController ScrollController) {
        return Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: ListView.builder(
            physics: ClampingScrollPhysics(),
            controller: ScrollController,
            itemCount: locations.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: [
                    SizedBox(
                      width: 50,
                      child: Divider(
                        thickness: 5,
                        color: darkBlue,
                      ),
                    ),
                  ]),
                );
              }

              if (index == locations.length + 1) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Center(
                    child: CustomButton(
                      label: 'حسن المسار',
                      hight: size.height * 0.05,
                      width: size.width * 0.35,
                      onPressed: () {},
                    ),
                  ),
                );
              }

              return Container(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFieldCustom(
                        label: locations[index - 1]['secondaryText'],
                        icon: Icons.edit,
                        location: locations[index - 1],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
