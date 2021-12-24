import 'package:flutter/material.dart';

import './screens/LocationsList.dart';

void main() => runApp(MapApp());

class MapApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: LocationsList(),
    );
  }
}
