import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';
import 'package:estudent/widgets/custom_scaffold.dart';
import 'package:estudent/widgets/floating_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: FloatingAppBar(
        title: const Text("TODO: Change to selected"),
        centerTitle: true,
        leading: IconButton(
          splashRadius: kIconButtonSplashRadius,
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      body: const Text("Kita"),
    );
  }
}
