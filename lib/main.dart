import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/LocationsProvider.dart';
import './screens/LocationsList.dart';

void main() => runApp(MapApp());

class MapApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocationsProvider>.value(
      value: LocationsProvider(),
      child: MaterialApp(
        home: Home(),
      ),
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
