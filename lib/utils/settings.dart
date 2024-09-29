import 'package:shared_preferences/shared_preferences.dart';

import 'package:estudent/constants.dart';
import 'package:estudent/models/settings.dart';

Future<Settings> getInitialSettings() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var provider = prefs.getString(kProviderKey) ?? kDefaultProvider;
  var username = prefs.getString(kUsernameKey);
  var password = prefs.getString(kPasswordKey);

  return Settings(
    provider: Uri.parse(provider),
    username: username,
    password: password,
  );
}
