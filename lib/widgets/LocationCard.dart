import 'package:flutter/material.dart';
import '../modals/Location.dart';
import '../Theme.dart';

class LocationCard extends StatelessWidget {
  Location location;
  LocationCard(this.location);
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        // padding:EdgeInsets.all(0),
        //color: Color(0xffAF97A6), //Color(0xffCABAC4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.str,
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    // decoration: BoxDecoration(
                    //   shape: BoxShape.circle,
                    //   border: Border.all(color: Colors.lightBlue, width: 6),
                    // ),
                    //height: 120,
                    width: 80,
                    // height: 10,
                    // width: 10,
                    //color:Colors.blue

                    child: location.image == null
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              //clipBehavior: ,
                              child: Image.asset("assets/images/beach.jpg"),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              // color: Colors.black,
                              image: DecorationImage(
                                image: FileImage(location.image),
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            // ClipRRect(
                            //   borderRadius: BorderRadius.circular(20),
                            //   //clipBehavior: ,
                            //   child: Image.file(location.image),
                            // ),
                          ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // color: Colors.black,
                      height: 40,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      padding: EdgeInsets.only(
                        // top: 5,
                        left: 5,
                      ),
                      child: Text(
                        location.locationName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      // width: 20,
                      // height: 120,
                      padding: EdgeInsets.only(
                        bottom: 10,
                        left: 5,
                      ),
                      child: Text(
                        location.description,
                        style: Theme.of(context).textTheme.bodyText2,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 30,
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
