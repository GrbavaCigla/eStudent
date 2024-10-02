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
  late String? _username = widget.initial.username;
  late String? _password = widget.initial.password;

  Uri get provider => _provider;
  String? get username => _username;
  String? get password => _password;

  set username(String? newValue) {
    setState(
      () => _username = newValue,
    );

    SharedPreferences.getInstance().then(
      (value) => value.setString(kUsernameKey, newValue.toString()),
    );
  }

  set password(String? newValue) {
    setState(
      () => _password = newValue,
    );

    SharedPreferences.getInstance().then(
      (value) => value.setString(kPasswordKey, newValue.toString()),
    );
  }

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
      username: _username,
      password: _password,
      child: widget.child,
    );
  }
}

class SettingsData extends InheritedWidget {
  final DynamicSettingsState state;
  final Uri provider;
  final String? username;
  final String? password;

  const SettingsData({
    super.key,
    required super.child,
    required this.provider,
    this.username,
    this.password,
    required this.state,
  });

  static SettingsData? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<SettingsData>();

  @override
  bool updateShouldNotify(SettingsData oldWidget) =>
      provider != oldWidget.provider ||
      username != oldWidget.username ||
      password != oldWidget.password;
}
