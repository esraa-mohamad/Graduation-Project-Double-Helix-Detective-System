import 'package:shared_preferences/shared_preferences.dart';
const String PREFS_KEY_ONBOARDING_SCREEN_VIEW ="PREFS_KEY_ONBOARDING_SCREEN_VIEW";
const String PREFS_KEY_IS_USER_LOGGED_IN ="PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_AUTH_TOKEN = "PREFS_KEY_AUTH_TOKEN";
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

  // //login
  // Future<void> setUserLoggedIn()async{
  //   _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  // }
  // Future<bool> isUserLoggedIn() async{
  //   return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN)??false;
  // }

  // Login with token
  Future<void> setUserLoggedIn(String token) async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
    _sharedPreferences.setString(PREFS_KEY_AUTH_TOKEN, token);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<String?> getAuthToken() async {
    return _sharedPreferences.getString(PREFS_KEY_AUTH_TOKEN);
  }

}