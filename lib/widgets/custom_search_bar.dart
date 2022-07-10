
import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';


class SearchBar extends StatefulWidget  {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
   GoogleMapController? mapController; 

  String location = "أبحث"; 
  
  

      @override
      Widget build(BuildContext context) {
        return Positioned(
        //search input bar
        top: 10,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), 
            ),
                       child: Container(
                         padding: EdgeInsets.all(0),
                         width: MediaQuery.of(context).size.width - 40,
                         child: ListTile(
                            title:Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Text(location, style: TextStyle(fontSize: 18),),
                              ],
                            ),
                            trailing: Icon(Icons.search),
                            dense: true,
                         )
                       ),
                    ),
                 )
               );
             
    }

    
}
