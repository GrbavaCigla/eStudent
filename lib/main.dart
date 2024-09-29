import 'package:flutter/material.dart';

import 'package:estudent/screens/home.dart';
import 'package:estudent/utils/theme.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eStudent',
      theme: lightTheme,
      home: HomeScreen(),
    );
  }
}
