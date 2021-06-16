
import 'dart:convert';

import 'package:pets_ecommerce/configuration/constants/strings.dart';
import 'package:pets_ecommerce/screens/auth/model/user.dart';
import 'package:pets_ecommerce/services/local_storage_service.dart';

class AuthServices {
  //
  static bool firstTimeOnApp() {
    return LocalStorageService.prefs.getBool(AppStrings.firstTimeOnApp) ?? true;
  }

  static firstTimeCompleted() async {
    await LocalStorageService.prefs.setBool(AppStrings.firstTimeOnApp, false);
  }

  //
  static bool authenticated() {
    return LocalStorageService.prefs.getBool(AppStrings.authenticated) ?? false;
  }

  static Future<bool> isAuthenticated() {
    return LocalStorageService.prefs.setBool(AppStrings.authenticated, true);
  }

  // Token
  static Future<String> getAuthToken() async {
    return LocalStorageService.prefs.getString(AppStrings.userAuthToken) ?? "";
  }

  static Future<bool> setAuthToken(token) async {
    return LocalStorageService.prefs.setString(AppStrings.userAuthToken, token);
  }


  //Firebase Token
  static Future<String> getFirebaseToken() async {
    return LocalStorageService.prefs.getString(AppStrings.userFirebaseToken) ?? "";
  }

  static Future<bool> setFirebaseToken(token) async {
    return LocalStorageService.prefs.setString(AppStrings.userFirebaseToken, token);
  }

  //Locale
  static String getLocale() {
    return LocalStorageService.prefs.getString(AppStrings.appLocale) ?? "en";
  }

  static Future<bool> setLocale(language) async {
    return LocalStorageService.prefs.setString(AppStrings.appLocale, language);
  }

  static UserModel currentUser;
  static Future<UserModel> getCurrentUser() async {
    if (currentUser == null ) {
      final userStringObject =
      await LocalStorageService.prefs.getString(AppStrings.userKey);
      final userObject = json.decode(userStringObject);
      currentUser.user = User.fromJson(userObject);
    }
    return currentUser;
  }

  static Future<UserModel> saveUser(dynamic jsonObject) async {
     currentUser = UserModel.fromJson(jsonObject);
    try {
      await LocalStorageService.prefs.setString(
        AppStrings.userKey,
        json.encode(
          currentUser.toJson(),
        ),
      );
      setAuthToken(currentUser.token);
      isAuthenticated();



      //subscribe to firebase topic
      // FirebaseService.firebaseMessaging.subscribeToTopic("${currentUser.id}");
      // FirebaseService.firebaseMessaging.subscribeToTopic("${currentUser.role}");

      return currentUser;
    } catch (error) {
      return null;
    }
  }

  static void logout() async {
    await LocalStorageService.prefs.clear();
    await LocalStorageService.prefs.setBool(AppStrings.firstTimeOnApp, false);
    // FirebaseService.firebaseMessaging.unsubscribeFromTopic("${currentUser.id}");
    // FirebaseService.firebaseMessaging
    //     .unsubscribeFromTopic("${currentUser.role}");
  }
}

