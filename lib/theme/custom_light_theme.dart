import 'package:flutter/material.dart';

import 'color_helper.dart';

class CustomTheme {
  ThemeMode get currentTheme => ThemeMode.dark;

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        color: ColorHelper.mercury.color,
        elevation: 0,
        centerTitle: true,
        toolbarTextStyle: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: ColorHelper.monochromaticGray500.color,
          ),
        ).bodyMedium,
        titleTextStyle: TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: ColorHelper.monochromaticGray500.color,
          ),
        ).titleLarge,
      ),
      fontFamily: 'SourceSansPro',
      primaryColor: ColorHelper.black.color,
      scaffoldBackgroundColor: ColorHelper.white.color,
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: ColorHelper.monochromaticGray150.color,
      ),
      cardTheme: CardTheme(
        elevation: 32,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        shadowColor: const Color.fromRGBO(0, 92, 169, 0.2),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
            color: Color.fromRGBO(125, 143, 161, 1), fontSize: 16.0, height: 1.7, fontWeight: FontWeight.w400),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        alignLabelWithHint: true,
        fillColor: const Color.fromRGBO(238, 238, 238, 1),
        hintStyle: const TextStyle(color: Color.fromRGBO(177, 177, 177, 1), fontSize: 15, fontWeight: FontWeight.w300),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1)),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        isDense: true,
        contentPadding: const EdgeInsets.all(20),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper.aigFieldError.color),
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorHelper.aigFieldError.color),
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
    );
  }
}
