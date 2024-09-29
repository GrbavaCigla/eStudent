import 'package:flutter/material.dart';

import 'package:estudent/dialogs/settings.dart';
import 'package:estudent/widgets/schedule/list.dart';
import 'package:estudent/widgets/settings.dart';
import 'package:estudent/constants.dart';
import 'package:estudent/widgets/custom_scaffold.dart';
import 'package:estudent/widgets/floating_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: FloatingAppBar(
        title: Text(DynamicSettings.of(context).provider.host),
        centerTitle: true,
        leading: IconButton(
          splashRadius: kIconButtonSplashRadius,
          icon: const Icon(Icons.dehaze_rounded),
          onPressed: () => showAdaptiveDialog(
            context: context,
            builder: (context) => SettingsDialog(),
          ),
        ),
      ),
      body: ScheduleList(),
    );
  }
}
