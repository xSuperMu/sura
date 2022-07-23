import 'package:flutter/foundation.dart';

class DataProvider with ChangeNotifier {
  List<Map<String, dynamic>> _locations = [];
  List<Map<String, dynamic>> _searchResults = [];

  set locations(List<Map<String, dynamic>> value) {
    _locations = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get locations {
    return _locations;
  }

  set searchResults(List<Map<String, dynamic>> value) {
    _searchResults = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get searchResults {
    return _searchResults;
  }

  void addLocation(Map<String, dynamic> location) {
    try {
      _locations.firstWhere((element) => element['placeId'] == location['placeId']);
    }
    on StateError {
      _locations.add(location);
      notifyListeners();
    }
  }
//when user clic delete button will be deleted 
  void removeLocation(Map<String, dynamic> location) {
      _locations.removeWhere((element) => element['placeId'] == location['placeId']);
      notifyListeners();
  }
}


