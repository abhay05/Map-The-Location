import 'dart:io';

import 'package:flutter/material.dart';
import 'package:map_the_location/helpers/db_helpers.dart';
import '../modals/Location.dart';

class LocationsProvider extends ChangeNotifier {
  List<Location> arr = [
    // Location(
    //   description: "Beautiful Location",
    //   locationName: "Agra",
    //   longitude: 12.5,
    //   latitude: 15.3,
    // ),
    // Location(
    //   description: "Amazing Place",
    //   locationName: "Mainpuri",
    //   longitude: 20.5,
    //   latitude: 25.3,
    // ),
  ];

  List<Location> get getLocations {
    return [...arr];
  }

  void addLocations(
      String id, String description, String location, File pickedImage) {
    arr.add(
      Location(
        id: id, //DateTime.now().toIso8601String(),
        description: description,
        locationName: location,
        image: pickedImage,
      ),
    );
    notifyListeners();
    DBHelper.insert(
      'locations',
      {
        'id': id,
        'title': location,
        'description': description,
        'image': pickedImage.path,
      },
    );
  }

  Future<void> fetchAndSet() async {
    final records = await DBHelper.getRecord('locations');
    print("records");
    print(records);
    var arrTemp = [];
    arrTemp = records.map(
      (record) {
        return Location(
          id: record['id'],
          locationName: record['title'],
          description: record['description'],
          image: File(record['image']),
        );
      },
    ).toList();
    // for (var record in records) {
    //   arrTemp.add(
    //     Location(
    //       id: record['id'],
    //       locationName: record['title'],
    //       description: record['description'],
    //       image: File(record['image']),
    //     ),
    //   );
    // }
    arr = arrTemp;
    print("arr");
    print(arr);
    return;
  }
}
