import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:provider/provider.dart';

import 'package:sura/themes/constants.dart';
import 'package:sura/widgets/custom_search_bar.dart';

import '../providers/control_provider.dart';
// this to autocomplete search and then

class SearchScreen extends StatelessWidget {
  final origin = LatLng(lat: 24.6500, lng: 46.7100);
  final kGoogleApiKey = "AIzaSyC_x2mS0g7Zmhx7DaRdBHnQcg1LDdKQ3_k";

  Future _searchText(BuildContext context, String text) async {
    if(text.isEmpty) {
      context.read<DataProvider>().searchResults = [];
      return;
    }

    final places = FlutterGooglePlacesSdk(kGoogleApiKey,
        locale: Locale.fromSubtags(
          countryCode: 'sa',
          languageCode: 'ar',
        ));

    FindAutocompletePredictionsResponse response =
        await places.findAutocompletePredictions(text, origin: origin);
    context.read<DataProvider>().searchResults =
        response.predictions.map((e) => e.toMap()).toList();
  }

  String distanceString(num? distanceInMeters) {
    if (distanceInMeters == null) return '';
    if (distanceInMeters < 1000) return '${distanceInMeters}m';
    if (distanceInMeters < 10000)
      return '${(distanceInMeters / 100).round() / 10}km';
    return '${(distanceInMeters / 1000).round()}km';
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = context.watch<DataProvider>().searchResults;
    final theme = Theme.of(context);
    print(searchResults);
    return WillPopScope(
      onWillPop: () async {
        context.read<DataProvider>().searchResults = [];
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90),
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: InkWell(
                        onTap: (){
                          context.read<DataProvider>().addLocation(searchResults[index]);
                          context.read<DataProvider>().searchResults = [];
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.add_circle_outline,
                          color: darkBlue,
                        ),
                      ),
                      leading: SizedBox(
                        width: 50,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.pin_drop,
                              color: darkBlue,
                            ),
                            Text(
                              distanceString(
                                  searchResults[index]['distanceMeters']),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: darkBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(searchResults[index]['secondaryText']),
                          Text(searchResults[index]['primaryText']),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
              LimitedBox(
                maxHeight: 50,
                child: SearchBar(
                  searchEnabled: true,
                  onTextChange: (String text) {
                    _searchText(context, text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
