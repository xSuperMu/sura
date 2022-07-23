import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart'
    as placesSdk;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sura/models/screens/search.dart';


import '../../themes/constants.dart';
import '../../widgets/custom_bottom_sheet.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_search_bar.dart';
import '../../widgets/custom_textFormField.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //for test
  static const _map = CameraPosition(
    target: LatLng(24.6500, 46.7100),
    zoom: 11.5,
  );
  GoogleMapController? mapController;
  String location = "Search Location";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: SizedBox(
                  height: constraints.maxHeight / 2,
                  child: GoogleMap(
                    initialCameraPosition: _map,
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      //method called when map is created
                      setState(() {
                        mapController = controller;
                      });
                    },
                  ),
                ),
              );
            }),
            InkWell(
              child: SearchBar(),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              ),
            ),
            BottomSheetCustom(),
          ],
        ),
      ),
    );
  }
}
