import 'package:flutter/material.dart';
import '../modals/Location.dart';
import '../Theme.dart';

class LocationCard extends StatelessWidget {
  Location location;
  LocationCard(this.location);
  Widget build(BuildContext context) {
    return Card(
      // padding:EdgeInsets.all(0),
      //color: Color(0xffAF97A6), //Color(0xffCABAC4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.lightBlue, width: 6),
            ),
            // height: 10,
            // width: 10,
            //color:Colors.blue

            child: location.image == null
                ? CircleAvatar(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      //clipBehavior: ,
                      child: Image.asset("assets/images/beach.jpg"),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: FileImage(location.image),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(20),
                    //   //clipBehavior: ,
                    //   child: Image.file(location.image),
                    // ),
                  ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: 5,
                  ),
                  child: Text(
                    location.locationName,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 5,
                    left: 5,
                  ),
                  child: Text(
                    location.description,
                    style: Theme.of(context).textTheme.bodyText2,
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
