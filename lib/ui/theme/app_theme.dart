import 'package:fitness/ui/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  ThemeData lightTheme(context) => ThemeData(
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        colorScheme: const ColorScheme.light(),
        primarySwatch: Colors.purple,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
        scaffoldBackgroundColor: AppColors.scaffoldColor,
      );

  ThemeData darkTheme(context) => ThemeData(
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: const ColorScheme.dark(),
        primarySwatch: Colors.amber,
        textTheme: GoogleFonts.actorTextTheme(
          Theme.of(context).textTheme.apply(),
        ),
        scaffoldBackgroundColor: Colors.black,
      );
}
