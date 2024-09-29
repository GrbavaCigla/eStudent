import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';
import 'package:estudent/utils/color.dart';

final primarySwatch = generateMaterialColor(Color(0xFF884541));

final appBarTheme = AppBarTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kFloatingAppBarBorderRadius),
  ),
);

final dialogTheme = DialogTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kDialogBorderRadius),
  ),
);

final inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(kInputBorderRadius),
  ),
  filled: true,
  isDense: true,
);

var buttonStyle = ButtonStyle(
  padding: WidgetStateProperty.all(EdgeInsets.all(kButtonPadding)),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kButtonBorderRadius),
    ),
  ),
);

final elevatedButtonTheme = ElevatedButtonThemeData(style: buttonStyle);
final textButtonTheme = TextButtonThemeData(style: buttonStyle);
final outlinedButtonTheme = OutlinedButtonThemeData(style: buttonStyle);

final lightTheme = ThemeData(
  useMaterial3: false,
  colorSchemeSeed: primarySwatch,
  appBarTheme: appBarTheme,
  dialogTheme: dialogTheme,
  inputDecorationTheme: inputDecorationTheme,
  elevatedButtonTheme: elevatedButtonTheme,
  textButtonTheme: textButtonTheme,
  outlinedButtonTheme: outlinedButtonTheme,
);
