import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: kPrimaryColor,
    onPrimary: Colors.white,
    secondary: kAccentColor,
    onSecondary: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    surface: kBackgroundColor,
    onSurface: Colors.black87,
  ),
  scaffoldBackgroundColor: kBackgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.indieFlower(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
      letterSpacing: 2,
      shadows: [
        Shadow(blurRadius: 8, color: Colors.black26, offset: Offset(0, 3)),
      ],
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kAccentColor,
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  listTileTheme: ListTileThemeData(
    iconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(kPrimaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.white,
    textStyle: GoogleFonts.quicksand(
      color: kPrimaryColor,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  textTheme: GoogleFonts.quicksandTextTheme().copyWith(
    displayLarge: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Colors.black87,
      letterSpacing: 1,
    ),
    displayMedium: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 28,
      color: Colors.black87,
    ),
    headlineMedium: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black87,
    ),
    titleLarge: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 20,
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700, // kräftiger
      fontSize: 18,
      color: Colors.black87,
      letterSpacing: 0.3,
    ),
    titleSmall: GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black87,
    ),
    bodyLarge: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700, // kräftiger
      fontSize: 18,
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.black87,
    ),
    bodySmall: GoogleFonts.quicksand(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      color: Colors.black87,
    ),
    labelLarge: GoogleFonts.quicksand(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      color: Colors.black87,
    ),
    labelMedium: GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      color: Colors.black87,
    ),
    labelSmall: GoogleFonts.quicksand(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Colors.black54,
    ),
  ),
);
