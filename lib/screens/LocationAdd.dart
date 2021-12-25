import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:map_the_location/providers/LocationsProvider.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:provider/provider.dart';

class AddLocation extends StatefulWidget {
  AddLocationState createState() {
    return AddLocationState();
  }
}

class AddLocationState extends State<AddLocation> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  int _imageLoaded = 0;
  File _clickedImage;

  Future<void> clickImage() async {
    _clickedImage = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (_clickedImage == null) {
      return; // if user clicks button without clicking pictures return the function
      // otherwise we will have errors;
    }
    _imageLoaded = 1;
    setState(() {
      //       _imageLoaded = _imageLoaded == 1 ? 0 : 1;
    });
    // make sure quality of image is high only if needed
    Directory storagepath = await syspath.getApplicationDocumentsDirectory();
    var filename = path.basename(_clickedImage.path);
    var storedImage = await _clickedImage.copy('${storagepath.path}/$filename');
  }

  Future<void> submitForm() {
    var description = _textController.text;
    var location = _locationController.text;
    var pickedImage = _clickedImage;
    Provider.of<LocationsProvider>(context, listen: false)
        .addLocations(description, location, pickedImage);
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: ,
      appBar: AppBar(),
      body: Center(
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormField(
                  builder: (ctx) {
                    return Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: TextFormField(
                        controller: _locationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(
                            10,
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            height: 20,
                            child: Image.asset("assets/images/city-hall.png",
                                fit: BoxFit.cover),
                          ),
                          // ImageIcon(
                          //   AssetImage(

                          //   ),
                          // ),

                          //helperText: "Title",
                          labelText: "Title", //Place holder
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    );
                  },
                ),
                FormField(
                  builder: (ctx) {
                    return Padding(
                      padding: EdgeInsets.all(
                        10,
                      ),
                      child: TextFormField(
                        controller: _textController,
                        maxLines: 3,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(
                            10,
                          ),
                          prefixIcon: Container(
                            padding: EdgeInsets.all(10),
                            height: 20,
                            child: Image.asset("assets/images/description.png",
                                fit: BoxFit.cover),
                          ),
                          // ImageIcon(
                          //   AssetImage(

                          //   ),
                          // ),

                          //helperText: "Title",
                          labelText: "Description", //Place holder
                          labelStyle: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: Text(
                    "Upload Picture",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                FormField(
                  builder: (ctx) => Container(
                      height: 200,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: _imageLoaded == 0
                          ? InkWell(
                              splashColor: Theme.of(context).cardTheme.color,
                              onTap:
                                  clickImage, // clickImage() will call the function while parsing the code instead of when user clicks

                              child: Image.asset(
                                "assets/images/upload-image.png",
                                fit: BoxFit.contain,
                              ),
                            )
                          : InkWell(
                              onTap: clickImage,
                              child: Image.file(
                                _clickedImage,
                                fit: BoxFit.cover,
                                //width: double.infinity,
                              ),
                            )),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: Text(
                    "Enter Location",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Icon(Icons.add_location_alt),
                      ),
                      Text(
                        "Current Location",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ]),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Icon(Icons.map),
                        ),
                        Text(
                          "Enter your location",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  color: Theme.of(context).cardTheme.color,
                  child: FlatButton(
                    onPressed: submitForm,
                    child: Text(
                      "Add Location",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
