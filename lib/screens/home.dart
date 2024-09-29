import 'package:flutter/material.dart';

import 'package:estudent/widgets/custom_scaffold.dart';
import 'package:estudent/widgets/floating_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: FloatingAppBar(
        title: Text("Kita"),
      ),
      body: Text("Kita"),
    );
  }
}
