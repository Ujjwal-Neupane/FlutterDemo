import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //initialize
  initialize() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('flutter');

    IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await FlutterLocalNotificationsPlugin().initialize(initializationSettings);
  }

//local notification

  localNotification(String pickedTime) async {
    var androidNotificationDetails = AndroidNotificationDetails('id', 'channel',
        channelDescription: 'description', importance: Importance.max);
    var IosNotificationDetails = IOSNotificationDetails();

    var platform = NotificationDetails(
        android: androidNotificationDetails, iOS: IosNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        0, 'demo', 'Your time is $pickedTime', platform,
        payload: 'welcome to demo app');
  }
  // static final _notifications = FlutterLocalNotificationsPlugin();

  // static initNotification() async {
  //   final AndroidInitializationSettings initializationSettingsAndroid =
  //       AndroidInitializationSettings('@drawable/ic_launcher_demo');

  //   final InitializationSettings initializationSettings =
  //       InitializationSettings(
  //     android: initializationSettingsAndroid,
  //   );

  //   await _notifications.initialize(initializationSettings);
  // }

  // static showNotification({
  //   int id = 0,
  //   String? title,
  //   String? body,
  //   String? payload,
  // }) async {
  //   await _notifications.show(
  //     id,
  //     title,
  //     body,
  //     _notificationDetails(),
  //     payload: payload,
  //   );
  // }

  // static _notificationDetails() {
  //   return NotificationDetails(
  //     android: AndroidNotificationDetails(
  //       'channel id',
  //       'channel name',
  //       channelDescription: 'channel description',
  //       importance: Importance.max,
  //       priority: Priority.high,
  //     ),
  //     iOS: IOSNotificationDetails(),
  //   );
  // }

}
