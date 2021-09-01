
import 'dart:convert';

import 'package:pets/configuration/constants/strings.dart';
import 'package:pets/screens/auth/model/user.dart';
import 'package:pets/screens/widgets/drawer/custom_drawer.dart';
import 'package:pets/services/local_storage_service.dart';

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
    return LocalStorageService.prefs.getBool(AppStrings.authenticated)==null?false : true;
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
      if(userStringObject==null)return UserModel(error: true);
      final userObject = json.decode(userStringObject);
      currentUser = UserModel.fromJson(userObject);
    }
    return currentUser;
  }


  static Future<UserModel> saveUser(dynamic jsonObject) async {

    await  LocalStorageService.prefs.clear();
     currentUser = UserModel.fromJson(jsonObject);
     gusetId=currentUser.user.id;
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


  static bool isValidPhoneNumber(String string) {
    // Null or empty string is invalid phone number
    if (string == null || string.isEmpty) {
      return false;
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  static void logout() async {
    await LocalStorageService.prefs.clear();
    await LocalStorageService.prefs.setBool(AppStrings.firstTimeOnApp, false);
    // FirebaseService.firebaseMessaging.unsubscribeFromTopic("${currentUser.id}");
    // FirebaseService.firebaseMessaging
    //     .unsubscribeFromTopic("${currentUser.role}");
  }
}

