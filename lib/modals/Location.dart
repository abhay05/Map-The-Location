import 'dart:io'; // File class

class Location {
  String locationName;
  String description;
  String picUrl;
  double longitude;
  double latitude;
  File image;
  String address;
  String id;

  Location({
    this.description,
    this.locationName,
    this.picUrl,
    this.longitude,
    this.latitude,
    this.image,
    this.id,
  });
}
