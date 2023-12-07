import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static Color get main => const Color(0xFF27AE60);
  static Color get grey2 => const Color(0xFFBDBDBD);
}

class AppTheme {
  static ThemeData get light => ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsApp.main),
        textTheme: GoogleFonts.robotoTextTheme().copyWith(),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            textStyle: const TextStyle(color: Colors.green),
            backgroundColor: Colors.white,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: ColorsApp.main,
            unselectedItemColor: ColorsApp.grey2,
            unselectedLabelStyle: const TextStyle(fontSize: 10),
            selectedLabelStyle: const TextStyle(fontSize: 10),
            showUnselectedLabels: true,
            enableFeedback: true,
            elevation: 1,
            type: BottomNavigationBarType.fixed),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsApp.main,
        ),
      );
}
