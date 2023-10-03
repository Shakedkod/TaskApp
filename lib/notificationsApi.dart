import "package:firebase_messaging/firebase_messaging.dart";

class FirebaseApi
{
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    Future<void> initNotifications() async
    {
        await _firebaseMessaging.requestPermission();
        final fcmToken = await _firebaseMessaging.getToken(
            vapidKey: "BLXcG9NIYRkib__fkS7FBbgZpEjOU6n7VLMyKcbizBsEL5avybOtVx2bkxWPxc_EQ8O3HyStg0JBeA-Iultkz9U"
        );
        print(fcmToken);
    }
}