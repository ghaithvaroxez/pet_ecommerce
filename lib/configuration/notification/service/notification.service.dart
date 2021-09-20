import 'dart:convert';

import 'package:pets/configuration/constants/strings.dart';

import '../model/notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationService {
  //
  static Future<List<NotificationModel>> getNotifications() async {
    //
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    final notificationsStringList = prefs.getString(
      AppStrings.notificationsKey,
    );

    if (notificationsStringList == null) {
      return [];
    }

    return (jsonDecode(notificationsStringList) as List)
        .asMap()
        .entries
        .map((notificationObject) {
      //
      return NotificationModel(
        index: notificationObject.key,
        title: notificationObject.value["title"],
        body: notificationObject.value["body"],
        timeStamp: notificationObject.value["timeStamp"],
      );
    }).toList();
  }

  static void addNotification(NotificationModel notification) async {
    final notifications = await getNotifications() ?? [];
    notifications.insert(0, notification);
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    prefs.setString(
      AppStrings.notificationsKey,
      jsonEncode(notifications),
    );
  }

  static void updateNotification(NotificationModel notificationModel) async {
    SharedPreferences prefs;
    try {
      prefs = await SharedPreferences.getInstance();
    } catch (e) {
      print(e);
    }
    final notifications = await getNotifications();
    notifications.removeAt(notificationModel.index);
    notifications.insert(notificationModel.index, notificationModel);
    await prefs.setString(
      AppStrings.notificationsKey,
      jsonEncode(notifications),
    );
  }
}
