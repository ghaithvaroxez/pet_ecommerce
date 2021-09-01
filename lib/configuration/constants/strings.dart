

import 'dart:convert';

import 'package:pets/services/local_storage_service.dart';

class AppStrings {
  //
  // static String get appName => env('app_name');
  // static String get companyName => env('company_name');
  // static String get googleMapApiKey => env('google_maps_key');
  // static String get fcmApiKey => env('fcm_key');
  // static String get currencySymbol => env('currency');
  // static String get countryCode => env('country_code');
  // static bool get enableOtp => env('enble_otp') == "1";
  // static bool get enableFood => env('enableFood') == "1";
  // static bool get enableParcel => env('enableParcel') == "1";
  // static bool get enableSingleVendor => env('enableSingleVendor') == "1";

  //DONT'T TOUCH
  // static const String notificationChannel = "2021";

  // DON'T TOUNCH Ya habab
  //for app usage
  static String firstTimeOnApp = "first_time";
  static String authenticated = "authenticated";
  static String userAuthToken = "auth_token";
  static String userFirebaseToken = "firebase_token";
  static String userKey = "user";
  static String appLocale = "locale";
  static String notificationsKey = "notifications";
  static String appCurrency = "currency";
  static String appColors = "colors";
  static String appRemoteSettings = "appRemoteSettings";
  static String googleMapApiKey = "AIzaSyDVHXZ7DdC2phLuH-HWiQ8X1J6PeOPEfrU";
  static String name = "pname";
  static String image = "pimage";
  //END DON'T TOUNCH Ya habab

  //
  //Change to your app store id
  static String appStoreId = "";

  //
  //saving
  static Future<bool> saveAppSettingsToLocalStorage(String stringMap) async {
    return await LocalStorageService.prefs
        .setString(AppStrings.appRemoteSettings, stringMap);
  }

  static dynamic appSettingsObject;
  static Future<void> getAppSettingsFromLocalStorage() async {
    appSettingsObject =
        LocalStorageService.prefs.getString(AppStrings.appRemoteSettings);
    if (appSettingsObject != null) {
      appSettingsObject = jsonDecode(appSettingsObject);
    }
  }

  static String env(String ref) {
    //
    getAppSettingsFromLocalStorage();
    //
    return appSettingsObject != null ? appSettingsObject[ref] : "";
  }
}