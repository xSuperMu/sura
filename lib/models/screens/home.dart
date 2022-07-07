import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../themes/constants.dart';
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
    static const _map = CameraPosition(
    target: LatLng(24.6500, 46.7100),
    zoom: 11.5,
  );
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       //  Container(child: BottomSheetCoustom()),
       // extendBodyBehindAppBar: true,
       
        body: Stack(
          
           children: [
             LayoutBuilder(
              builder: (BuildContext context , BoxConstraints constraints ) {
                  
                  return  Container(
                    decoration: BoxDecoration(
                      color: white,
                       borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                       topRight: Radius.circular(40))),
                       child: SizedBox(
                           
                         height: constraints.maxHeight/2,
                         child: GoogleMap(
                             initialCameraPosition: _map,
                             mapType: MapType.normal,
                             
                             ),
                             
                    ),
                  );
                  
              }),
            
            BottomSheetCoustom()
        ],  
      
        
        
        ),
          
          



        ),
       
    
      
    );
  }
}
