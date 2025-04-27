import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'constants.dart';

class NotificationHelper {
  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
  );

  static Future<void> init() async {
    // Step 1: Initialize Firebase (safe from duplicate app errors)
    try {
      await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: 'AIzaSyCavOBR3600qrC7uNRwqX6Egwo9bBiymSg',
          appId: '1:463487556848:android:d70ac2612a68551c513635',
          messagingSenderId: '463487556848',
          projectId: 'jassos',
          storageBucket: 'jassos.firebasestorage.app',
        ),
      );
    } catch (e) {
      print('Firebase already initialized: $e');
    }

    // Step 2: Request Notification Permission
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('✅ User granted notification permission.');

      // Step 3: Wait for APNs Token (iOS)
      String? apnsToken = await FirebaseMessaging.instance.getAPNSToken();
      print('📱 APNs Token: $apnsToken');

      // Step 4: Get FCM Token
      try {
        Constants.device_id = await FirebaseMessaging.instance.getToken();
        print('🚀 FCM Token: ${Constants.device_id}');
      } catch (e) {
        print('🔥 Error getting FCM token: $e');
      }

    // Step 5: Listen for FCM Token refresh
      try {
        FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
          Constants.device_id = newToken;
          print('♻️ FCM Token refreshed: $newToken');
        });
      } catch (e) {
        print('🔥 Error getting FCM token: $e');
      }

    } else {
      print('❌ User declined or has not accepted notification permission.');
    }

    // Step 6: Set foreground notification options
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Step 7: Background message handler
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);

    // Step 8: Local notifications setup
    await _setupLocalNotifications();
  }

  static Future<void> onInit() async {
    print('🔔 Notification helper started');

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('📥 Message received: ${message.notification?.title}');
      _showNotification(message.notification?.title, message.notification?.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('📬 App opened via notification: ${message.notification?.title}');
      _showNotification(message.notification?.title, message.notification?.body);
    });
  }

  static Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
    print('🌙 Handling background message: ${message.messageId}');
  }

  static Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);
  }

  static Future<void> _showNotification(String? title, String? body) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications.',
      importance: Importance.max,
      priority: Priority.high,
    );
    const DarwinNotificationDetails iosDetails = DarwinNotificationDetails();
    const NotificationDetails platformDetails = NotificationDetails(android: androidDetails, iOS: iosDetails);

    await _flutterLocalNotificationsPlugin.show(0, title ?? 'No Title', body ?? 'No Body', platformDetails);
  }
}
