import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/services/notiifcation_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotiDemo extends StatefulWidget {
  PushNotiDemo({Key? key}) : super(key: key);

  @override
  State<PushNotiDemo> createState() => _PushNotiDemoState();
}

class _PushNotiDemoState extends State<PushNotiDemo> {
  String pickedTime = '--:--';
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pickedTime,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 70),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => setTime(context),
              child: Text('Set Time'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () =>
                  notificationService.localNotification(pickedTime),
              child: Text('Local Notification'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setTime(context) async {
    TimeOfDay? time = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
    );

    if (time != null) {
      setState(() {
        pickedTime = time.format(context);
      });
    }
  }
}
