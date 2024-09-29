import 'package:shared_preferences/shared_preferences.dart';

import 'package:estudent/constants.dart';
import 'package:estudent/models/settings.dart';

Future<Settings> getInitialSettings() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var provider = prefs.getString(kProviderKey) ?? kDefaultProvider;

  return Settings(provider: Uri.parse(provider));
}
