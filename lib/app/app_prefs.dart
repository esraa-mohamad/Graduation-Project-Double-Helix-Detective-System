import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
const String PREFS_KEY_ONBOARDING_SCREEN_VIEW ="PREFS_KEY_ONBOARDING_SCREEN_VIEW";
const String PREFS_KEY_IS_USER_LOGGED_IN ="PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_AUTH_TOKEN = "PREFS_KEY_AUTH_TOKEN";

const String PREFS_KEY_TOKEN_EXPIRY = "PREFS_KEY_TOKEN_EXPIRY";

class AppPreferences{
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  //on boarding
  Future<void> setOnBoardingScreenViewed()async{
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEW, true);
  }
  Future<bool> isOnBoardingScreenViewed() async{
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEW)??false;
  }
  Future<void>
  setUserLoggedIn(String token, DateTime expiry) async {
    await _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
    await _sharedPreferences.setString(PREFS_KEY_AUTH_TOKEN, token);
    await _sharedPreferences.setString(PREFS_KEY_TOKEN_EXPIRY, expiry.toIso8601String());
  }

  Future<bool> isUserLoggedIn() async {
    bool? isLoggedIn = _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN);
    if (isLoggedIn != null && isLoggedIn) {
      String? expiryString = _sharedPreferences.getString(PREFS_KEY_TOKEN_EXPIRY);
      if (expiryString != null) {
        DateTime expiry = DateTime.parse(expiryString);
        if (expiry.isBefore(DateTime.now())) {
          // Token has expired, clear user data and exit the app
          await clearUserData();
          SystemNavigator.pop(); // Close the app
          return false ;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getAuthToken() async {
    bool isLoggedIn = await isUserLoggedIn();
    if (isLoggedIn) {
      return _sharedPreferences.getString(PREFS_KEY_AUTH_TOKEN);
    } else {
      return null;
    }
  }

  // Clear user data
  Future<void> clearUserData() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
    await _sharedPreferences.remove(PREFS_KEY_AUTH_TOKEN);
    await _sharedPreferences.remove(PREFS_KEY_TOKEN_EXPIRY);
    await _sharedPreferences.remove(PREFS_KEY_ONBOARDING_SCREEN_VIEW);
  }


}