import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  static final Color primaryColor = Color(0xFFF2994A);
  static final Color accentColor = Colors.white;
  static final Color secondaryColor = Colors.grey; // Grey for subtle components
  static final Color lightAccentColor = Colors.black; // Black text for contrast
  static final Color scaffoldBackgroundColor = Colors.white; // White background

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,

    // AppBar Theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      foregroundColor: lightAccentColor,
      backgroundColor: accentColor,
      iconTheme: IconThemeData(color: lightAccentColor),
      titleTextStyle: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: lightAccentColor,
        ),
      ),
    ),

    // Text Styles
    textTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().textTheme,
    ).apply(
      bodyColor: lightAccentColor,
      displayColor: lightAccentColor,
    ),

    primaryTextTheme: GoogleFonts.poppinsTextTheme(
      ThemeData.light().primaryTextTheme,
    ).apply(
      bodyColor: lightAccentColor,
      displayColor: lightAccentColor,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor,
        side: BorderSide(color: primaryColor),
        textStyle: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
    ),

    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: secondaryColor),
      ),
      hintStyle: GoogleFonts.poppins(color: secondaryColor),
    ),

    colorScheme: ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      onPrimary: Colors.white,
      onSecondary: lightAccentColor,
      onSurface: lightAccentColor,
      onBackground: lightAccentColor,
      surface: accentColor,
      background: scaffoldBackgroundColor,
    ),

    cardTheme: CardTheme(
      color: accentColor,
      shadowColor: secondaryColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
      unselectedItemColor: secondaryColor,
      backgroundColor: accentColor,
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryColor,
    ),
  );
}
