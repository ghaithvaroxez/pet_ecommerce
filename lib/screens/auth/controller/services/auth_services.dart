
import 'dart:convert';

import 'package:pets/configuration/constants/strings.dart';
import 'package:pets/configuration/printer.dart';
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

  static Future<int> getNotificationsCount() async {
    var i;
    try{
       i= LocalStorageService.prefs.getString(AppStrings.notificationsCount);
   return int.parse(i);
    }catch(e){
      consolePrint(e.toString());
      return 0;
    }

     // return i;
  }

  static Future<bool> setNotificationsCount(String count) async {
    return LocalStorageService.prefs.setString(AppStrings.notificationsCount,count);
  }

  // Token
  static Future<String> getName() async {
    return LocalStorageService.prefs.getString(AppStrings.name) ?? "";
  }

  static Future<bool> setName(String name) async {
    return LocalStorageService.prefs.setString(AppStrings.name, name);
  }

  // Token
  static Future<String> getImage() async {
    return LocalStorageService.prefs.getString(AppStrings.image) ?? "";
  }

  static Future<bool> setImage(String image) async {
    return LocalStorageService.prefs.setString(AppStrings.image, image);
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
    String k= LocalStorageService.prefs.getString(AppStrings.appLocale);
   if(k==null)
     return "en";
   else return k;
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
      if(currentUser.user.id!=146)isAuthenticated();
      setNotificationsCount("0");
if(currentUser.store.length!=0){
  setName(currentUser.storeName[0].name);
  setImage(currentUser.storeImage==null?null:currentUser.storeImage[0].image);
}
else{
setName(currentUser.user.firstName+" "+currentUser.user.lastName);
setImage(currentUser.user.image);
}


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

