import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';

var appBar = AppBarTheme(
  elevation: 1.0,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kFloatingAppBarBorderRadius),
  ),
);

var lightTheme = ThemeData(appBarTheme: appBar);
