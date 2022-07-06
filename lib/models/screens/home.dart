import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textFormField.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   //for test 
    static const _kGooglePlex = CameraPosition(
    target: LatLng(24.6500, 46.7100),
    zoom: 11.5,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       //  Container(child: BottomSheetCoustom()),
        body: GoogleMap(
        initialCameraPosition: _kGooglePlex,
      ), 
      ),
    );
  }
}
