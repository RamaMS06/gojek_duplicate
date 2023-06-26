import 'package:firebase_messaging/firebase_messaging.dart';

Future handleBackgroundMessage(RemoteMessage mesasage) async {}

handleMessage(RemoteMessage? message) {
  if (message == null) return;
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print(fcmToken);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
