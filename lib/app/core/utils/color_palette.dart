import 'package:flutter/material.dart';

class ColorPalette {
  ColorPalette._();

  static const MaterialColor primaryColor = MaterialColor(
    0xFF7C2B7C,
    {
      900: Color(0xFF7C2B7C),
      800: Color(0xFF7D2C7D),
      600: Color(0xFFB174AE),
      500: Color(0xFFA66DA6),
      400: Color(0xFFA97DA9),
      300: Color(0xFFA98BA9),
      200: Color(0xFFCCA7CC),
      100: Color(0xFFDFC9DF),
      50: Color(0xFFFBEFFC),
    },
  );

  static const MaterialColor blackPrimaryColor = MaterialColor(
    0xFF000000,
    {
      500: Color(0xFF000000),
      400: Color(0xFF260D26),
      300: Color(0xFF424242),
      200: Color(0xFF9E9E9E),
      100: Color(0xFFD9D9D9),
      50: Color(0xFFFBEFFC),
    },
  );

  static const MaterialColor whitePrimaryColor = MaterialColor(
    0xFFFFFFFF,
    {
      500: Color(0xFFFFFFFF),
      100: Color(0xFFEFEFEF),
      50: Color(0xffFBF5FC),
    },
  );

  static const Color red = Color(0xFFEB1C1C);
}
