import 'package:estudent/models/settings.dart';
import 'package:estudent/utils/settings.dart';
import 'package:estudent/widgets/settings.dart';
import 'package:flutter/material.dart';

import 'package:estudent/screens/home.dart';
import 'package:estudent/utils/theme.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: lightTheme.scaffoldBackgroundColor,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  final initialSettings = await getInitialSettings();

  runApp(App(
    settings: initialSettings,
  ));
}

class App extends StatelessWidget {
  final Settings settings;

  const App({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return DynamicSettings(
      initial: settings,
      child: MaterialApp(
        title: 'eStudent',
        theme: lightTheme,
        home: HomeScreen(),
      ),
    );
  }
}
