// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:wlt/helper/constants.dart';
//
//
// FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
// const AndroidNotificationChannel _channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   description: 'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );
//
// AndroidInitializationSettings? _initializationSettingsAndroid;
// DarwinInitializationSettings? _initializationSettingsIos;
// InitializationSettings? _initializationSettings;
//
//
// class NotificationHelper {
//
//   static init() async {
//     await Firebase.initializeApp(
//       // options: DefaultFirebaseOptions.currentPlatform,
//       options: FirebaseOptions(
//         apiKey: 'AIzaSyClghAQy2p9jF8-qPjovhHsGF3WvPbXAPU',
//         appId: '1:432901483845:android:9e372867863005ec92e22c',
//         messagingSenderId: '432901483845',
//         projectId: 'hitrips-aa935',
//         storageBucket: 'hitrips-aa935.firebasestorage.app',
//       ),
//     );
//     FirebaseMessaging.onBackgroundMessage(_fireBaseBackgroundHandler);
//     FirebaseMessaging.instance.requestPermission();
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//     await _flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//         AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(_channel);
//     try{
//       Constants.device_id = await FirebaseMessaging.instance.getToken();
//       print("FCM token :::: ${Constants.device_id}");
//     }catch(e){
//       print("FCM token Exception :: $e");
//     }
//   }
//
//   static onInit() {
//     _initNotification();
//
//     print("<<<<<<<<<<<<notification played successfully>>>>>>>>>>>>");
//
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//       print("onMessage: $message");
//       _showNotification(message.notification?.title, message.notification?.body);
//     });
//
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
//       print("onLaunch: $message");
//       _showNotification(message.notification!.title, message.notification!.body);
//     });
//
//     FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
//       print("onResume: $message");
//       _showNotification(message.notification!.title, message.notification!.body);
//     });
//
//   }
// }
//
// /// - - - - > > methods.. < < - - - -
// void _showNotification(var title , var body)async{
//   await _customNotification(title , body);
// }
//
// Future<void> _customNotification(var title , var body)async {
//   var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
//     'channel_ID',
//     'channel_Name',
//     channelDescription: 'channel_Description',
//     importance: Importance.max,
//     priority: Priority.high,
//     ticker: 'test ticker',
//   );
//   var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//   var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
//   await _flutterLocalNotificationsPlugin.show(0, title, body, platformChannelSpecifics, payload: 'Custom_Sound');
// }
//
// Future _initNotification() async {
//   _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   _initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher'); /// < - - ICON..
//   _initializationSettingsIos = const DarwinInitializationSettings(
//     requestAlertPermission: true,
//     requestBadgePermission: true,
//     requestSoundPermission: false,
//   );
//   _initializationSettings = InitializationSettings(android: _initializationSettingsAndroid, iOS: _initializationSettingsIos);
//   await _flutterLocalNotificationsPlugin.initialize(_initializationSettings!);
// }
//
//
// Future<void> _fireBaseBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }