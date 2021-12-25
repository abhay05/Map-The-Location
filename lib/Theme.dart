import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    bodyText2: GoogleFonts.openSans(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
  );

  static ThemeData light() {
    //overriding Theme.light() functions which is default value for Theme
    return ThemeData(
      textTheme: lightTextTheme,
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        backgroundColor: Color(
          0xff4F4047,
        ),
        foregroundColor: Colors.black,
      ),
      //backgroundColor: Colors.black, //Color(0xffEDE9EB),
      scaffoldBackgroundColor: Color(0xffEDE9EB),
      cardTheme: CardTheme(
        color: Color(0xffAF97A6),
      ),
      iconTheme: IconThemeData(
        color: Color(
          0xffE8C9E8,
        ),
      ),
    );
  }
}
