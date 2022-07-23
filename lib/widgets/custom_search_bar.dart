import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter/src/foundation/key.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchBar extends StatefulWidget {
  final bool searchEnabled;
  final Function(String)? onTextChange;

  SearchBar({this.searchEnabled = false, this.onTextChange});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  GoogleMapController? mapController;

  String location = "أبحث";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(0),
          width: max(MediaQuery.of(context).size.width - 40, 0),
          child: ListTile(
            title: widget.searchEnabled
                ? TextField(
                    onChanged: widget.onTextChange,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                  )
                : Text(
                    location,
                    style: TextStyle(fontSize: 18),
                    textDirection: TextDirection.rtl,
                  ),
            leading: Icon(Icons.search),
            dense: true,
          ),
        ),
      ),
    );
  }
}
