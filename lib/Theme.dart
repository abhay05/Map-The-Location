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
}
