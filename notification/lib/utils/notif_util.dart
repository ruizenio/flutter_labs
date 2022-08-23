// ignore_for_file: avoid_print
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifUtil {
  static void showLocalNotification(int id, String channelId, String title, String body, {String? payload}) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId, 'testing',
      channelDescription: 'my testing channel',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      ticker: 'ticker',
    );

    const IOSNotificationDetails iosPlatformChannelSpecific = IOSNotificationDetails();

    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecific,
    );

    await flutterLocalNotificationsPlugin.show(
      id, title, body, platformChannelSpecifics, payload: payload,
    );
  }

   static void initializeNotification() {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin 
    = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid 
    = AndroidInitializationSettings('app_icon');

    const IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings();
    
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void registerFCM() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    String? token = await messaging.getToken();

    if (token != null) {
      print("CURRENT TOKEN : $token");
    }
  }
}