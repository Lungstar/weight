import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> setUserPref(String email) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("email", email).then((success) {
      return true;
    });
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear().then((value) => true);
  }
}
