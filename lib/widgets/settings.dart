import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:estudent/models/settings.dart';
import 'package:estudent/constants.dart';

class DynamicSettings extends StatefulWidget {
  final Widget child;
  final Settings initial;

  const DynamicSettings({
    super.key,
    required this.child,
    required this.initial,
  });

  static DynamicSettingsState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsData>()!.state;

  @override
  DynamicSettingsState createState() => DynamicSettingsState();
}

class DynamicSettingsState extends State<DynamicSettings> {
  late Uri _provider = widget.initial.provider;

  Uri get provider => _provider;

  set provider(Uri newValue) {
    setState(
      () => _provider = newValue,
    );

    SharedPreferences.getInstance().then(
      (value) => value.setString(kProviderKey, newValue.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsData(
      state: this,
      provider: _provider,
      child: widget.child,
    );
  }
}

class SettingsData extends InheritedWidget {
  final DynamicSettingsState state;
  final Uri provider;

  const SettingsData({
    super.key,
    required super.child,
    required this.provider,
    required this.state,
  });

  static SettingsData? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsData>();

  @override
  bool updateShouldNotify(SettingsData oldWidget) =>
      provider != oldWidget.provider;
}
