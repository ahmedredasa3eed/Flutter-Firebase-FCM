import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class CustomNotification {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late BuildContext context;

  Future notificationConfig(context) async {

   this.context = context;
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();


   var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
   var initializationSettingsIOS = IOSInitializationSettings(
       requestSoundPermission: true,
       requestBadgePermission: true,
       requestAlertPermission: true,
       onDidReceiveLocalNotification: onDidReceiveLocalNotification);

   var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
   flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

   flutterLocalNotificationsPlugin.initialize(initializationSettings,
       onSelectNotification: selectNotification);
  }

  Future onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title!),
        content: Text(body!),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
          )
        ],
      ),
    );
  }


  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    }
  }

  void showNotification(String title, String body) async {
    var androidNotificationDetails = AndroidNotificationDetails("com.ahmedreda.fcmahmed", "channelName", "channelDescription", priority: Priority.max,ongoing: true,autoCancel: false);
    var iosNotificationDetails = IOSNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);

    NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);

    await flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails, payload: body);

  }



}