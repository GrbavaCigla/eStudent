import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';

class SettingsDialog extends StatelessWidget {
  const SettingsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(kDialogInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Provider",
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(hintText: "Username"),
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            )
          ],
        ),
      ),
    );
  }
}
