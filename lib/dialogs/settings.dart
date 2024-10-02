import 'package:estudent/widgets/settings.dart';
import 'package:flutter/material.dart';

import 'package:estudent/constants.dart';
import 'package:flutter/services.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  bool _passwordVisible = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var inputFormatters = [
      FilteringTextInputFormatter.singleLineFormatter,
      LengthLimitingTextInputFormatter(128)
    ];
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(kDialogInset),
        child: Form(
          key: _formKey,
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
              SizedBox(height: kSettingsDialogSpacing),
              TextFormField(
                onSaved: (value) =>
                    DynamicSettings.of(context).provider = Uri.parse(value!),
                inputFormatters: inputFormatters,
                initialValue: DynamicSettings.of(context).provider.toString(),
                validator: _providerValidator,
                decoration: InputDecoration(
                  hintText: "Provider",
                ),
              ),
              SizedBox(height: kSettingsDialogSpacing),
              TextFormField(
                onSaved: (value) =>
                    DynamicSettings.of(context).username = value,
                inputFormatters: inputFormatters,
                initialValue: DynamicSettings.of(context).username,
                decoration: InputDecoration(hintText: "Username"),
              ),
              SizedBox(height: kSettingsDialogSpacing),
              TextFormField(
                onSaved: (value) =>
                    DynamicSettings.of(context).password = value,
                inputFormatters: inputFormatters,
                initialValue: DynamicSettings.of(context).password,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  hintText: "Password",
                  suffixIcon: IconButton(
                    splashRadius: kIconButtonSplashRadius,
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: _changePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: kSettingsDialogSpacing),
              ElevatedButton(
                onPressed: _saveSettings,
                child: Text(
                  "Save",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _saveSettings() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Successfully saved."),
        ),
      );
    }
  }

  String? _providerValidator(value) {
    return Uri.tryParse(value) == null ? "Please enter valid url." : null;
  }
}
