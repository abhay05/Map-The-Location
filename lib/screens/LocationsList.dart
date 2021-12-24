import 'package:flutter/material.dart';
import '../modals/Location.dart';
import '../widgets/LocationCard.dart';

class LocationsList extends StatelessWidget {
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, ind) => LocationCard(arr[ind]),
              separatorBuilder: (ctx, ind) => SizedBox(
                    height: 10,
                  ),
              itemCount: arr.length),
          Expanded(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    //clipBehavior: ,
                    child: Image.asset("assets/images/beach.jpg"),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 15,
                        color: Colors.lightBlue,
                      ),
                      // shape: BoxShape.circle,
                    ),
                    //child:
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
