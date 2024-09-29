import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';
import 'package:estudent/utils/color.dart';

var primarySwatch = generateMaterialColor(Color(0xFF884541));

var appBar = AppBarTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kFloatingAppBarBorderRadius),
  ),
);

var lightTheme = ThemeData(
  useMaterial3: false,
  colorSchemeSeed: primarySwatch,
  appBarTheme: appBar,
);
