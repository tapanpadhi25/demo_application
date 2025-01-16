import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData? getTheme(isLightMode) {
    return isLightMode
        ? ThemeData(
            primaryColor: const Color(0xffFBEB5A),
            secondaryHeaderColor: Color(0xffE7E6DD),
            scaffoldBackgroundColor: Colors.white,
            textTheme: TextTheme(
              displayLarge: GoogleFonts.openSans(),
              titleSmall: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              titleMedium: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
              titleLarge: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ))
        : ThemeData(
            primaryColor: const Color(0xff151515),
            secondaryHeaderColor: Colors.white,
            textTheme: const TextTheme(
              titleSmall: TextStyle(color: Colors.white, fontSize: 14),
              titleMedium: TextStyle(color: Colors.white, fontSize: 16),
              titleLarge: TextStyle(color: Colors.white, fontSize: 18),
            ),
          );
  }
}
