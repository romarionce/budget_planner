import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorsApp {
  static Color get main => const Color(0xFF27AE60);
  static Color get grey2 => const Color(0xFFBDBDBD);
  static Color get mainText => const Color(0xFF000000);
  static Color get backgroundGrey => const Color(0xFFF2F2F2);
}

class AppTheme {
  static ThemeData _base(int index) => ThemeData(
        colorScheme: _getColorScheme(index),
        textTheme: GoogleFonts.robotoTextTheme(index == 0
            ? ThemeData.dark().textTheme
            : ThemeData.light().textTheme),
        // textTheme: GoogleFonts.robotoTextTheme().copyWith(
        //   titleLarge: const TextStyle(
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ).copyWith(
        appBarTheme: const AppBarTheme(centerTitle: false),
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
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ))),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            // selectedItemColor: ColorsApp.main,
            // unselectedItemColor: ColorsApp.grey2,
            unselectedLabelStyle: TextStyle(fontSize: 10),
            selectedLabelStyle: TextStyle(fontSize: 10),
            showUnselectedLabels: true,
            enableFeedback: true,
            elevation: 1,
            type: BottomNavigationBarType.fixed),
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          fillColor: ColorsApp.grey2.withOpacity(.4),
          contentPadding: const EdgeInsets.all(16),
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorsApp.mainText,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );

  static ColorScheme _getColorScheme(int index) => ColorScheme.fromSeed(
        seedColor: ColorsApp.main,
        brightness: Brightness.values[index],
      );

  static ThemeData light() => _base(0);

  static ThemeData dark() => _base(1);

  static ThemeData get s => ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: false),
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
}
