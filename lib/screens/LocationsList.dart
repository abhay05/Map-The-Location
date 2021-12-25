import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/LocationsProvider.dart';
import '../widgets/LocationCard.dart';

class LocationsList extends StatelessWidget {
  Widget build(BuildContext context) {
    var locationsProvider = Provider.of<LocationsProvider>(context);
    var arr = locationsProvider.getLocations;
    return Scaffold(
      appBar: AppBar(
        //title: Text("This is app bar"),
        // iconTheme: IconThemeData(
        //   color: Color(
        //     0xffE8C9E8,
        //   ),
        //),
        iconTheme: Theme.of(context).iconTheme,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],

        //backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        // backgroundColor: Color(
        //   0xff4F4047, //0xff382E33,
        // ),
        elevation: 0,
      ),
      //backgroundColor: Color(0xffEDE9EB),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, ind) => LocationCard(arr[ind]),
              separatorBuilder: (ctx, ind) => SizedBox(
                    height: 0,
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
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                        width: 15,
                        color: Theme.of(context)
                            .scaffoldBackgroundColor, //Color(0xffEDE9EB),
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
