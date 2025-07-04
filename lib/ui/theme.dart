import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

/// Das Haupt-Theme der App mit Farbpalette und Schriftarten.
///
/// Verwendet Google Fonts (Indie Flower für AppBar, Quicksand für Text).
final ThemeData appTheme = ThemeData(
  // Farbkonzept
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

  // Hintergrundfarbe der Scaffold-Widgets
  scaffoldBackgroundColor: kBackgroundColor,

  // AppBar Styling mit Indie Flower für einen handschriftlichen Look
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
    iconTheme: const IconThemeData(color: Colors.white),
  ),

  // FloatingActionButton mit Akzentfarbe Türkis
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kAccentColor,
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  // ListTile Standard Styling
  listTileTheme: const ListTileThemeData(
    iconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
  ),

  // Checkbox Styling mit türkisem Füllfarbton
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStatePropertyAll(kPrimaryColor),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
  ),

  // PopupMenu Styling mit abgerundeten Ecken
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.white,
    textStyle: GoogleFonts.quicksand(
      color: kPrimaryColor,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),

  // Text Theme mit verschiedenen Gewichtungen und Größen
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
      fontWeight: FontWeight.w700,
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
      fontWeight: FontWeight.w700,
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
