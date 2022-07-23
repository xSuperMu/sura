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

  
  //when user clic delete button will be deleted 
  void removeLocation(Map<String, dynamic> location) {
      _locations.removeWhere((element) => element['placeId'] == location['placeId']);
      notifyListeners();
  }
}
