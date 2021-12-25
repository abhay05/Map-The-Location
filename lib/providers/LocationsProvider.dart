import 'dart:io';

import 'package:flutter/material.dart';
import '../modals/Location.dart';

class LocationsProvider extends ChangeNotifier {
  List<Location> arr = [
    Location(
      description: "Beautiful Location",
      locationName: "Agra",
      longitude: 12.5,
      latitude: 15.3,
    ),
    Location(
      description: "Amazing Place",
      locationName: "Mainpuri",
      longitude: 20.5,
      latitude: 25.3,
    ),
  ];

  List<Location> get getLocations {
    return [...arr];
  }

  void addLocations(String description, String location, File pickedImage) {
    arr.add(Location(
        description: description, locationName: location, image: pickedImage));
    notifyListeners();
  }
}
