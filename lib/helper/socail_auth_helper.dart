// import 'dart:developer';
//
// import 'package:jasoos/main_models/social_auth_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
//
// abstract class SocialAuthHelper {
//   // final facebook = FacebookAuth.instance;
//   Future<void> checkAndRefreshToken() async {
//     final LoginResult result = await FacebookAuth.instance.login();
//
//     if (result.status == LoginStatus.success) {
//       final AccessToken accessToken = result.accessToken!;
//       print("New Access Token: ${accessToken.tokenString}");
//     } else {
//       print("Facebook login failed: ${result.message}");
//     }
//   }
//
//   static Future<SocialAuthModel> loginWithFacebook() async {
//     await FacebookAuth.instance.logOut();
//     final result = await FacebookAuth.instance.login();
//     if (result.status == LoginStatus.success) {
//       // _accessToken = result.accessToken;
//       final userData = await FacebookAuth.instance.getUserData();
//       print("email ${userData["email"]}");
//       print("name ${userData["name"]}");
//       print("image ${userData["picture"]}");
//     } else {
//       print(result.status);
//       print(result.message);
//     }
//     final _facebookAuthCredential =
//     FacebookAuthProvider.credential(result.accessToken!.tokenString);
//     final SocialAuthModel _model = SocialAuthModel();
//     _model.statusCode = 200;
//     _model.message = "success";
//     _model.accessToken = _facebookAuthCredential.accessToken;
//     UserCredential _user = await FirebaseAuth.instance
//         .signInWithCredential(_facebookAuthCredential);
//     _model.id = _user.user?.uid;
//     _model.accessToken = _user.credential?.accessToken;
//     _model.name = _user.user?.displayName;
//     _model.image = _user.user?.photoURL;
//     _model.email = _user.user?.email;
//     _model.password = _user.user?.uid;
//     print(_user.user);
//     _model.printData();
//     return _model;
//   }
//
//   static Future<SocialAuthModel> loginWithGoogle() async {
//     await GoogleSignIn().signOut();
//     final SocialAuthModel _model = SocialAuthModel();
//     final GoogleSignInAccount? _googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication _googleAuth =
//     await _googleUser!.authentication;
//     log("${_googleUser}");
//     _model.statusCode = 200;
//     _model.message = "success";
//     _model.id = _googleUser.id;
//     _model.accessToken = _googleAuth.accessToken;
//     _model.idToken = _googleAuth.idToken;
//     _model.name = _googleUser.displayName;
//     _model.image = _googleUser.photoUrl;
//     _model.email = _googleUser.email;
//     _model.password = _googleUser.id;
//     _model.printData();
//     return _model;
//   }
//
//   // static Future<SocialAuthModel> loginWithX() async {
//   //   final twitterLogin = TwitterLogin(
//   //     // Consumer API keys
//   //     apiKey: 'xxxx',
//   //     // Consumer API Secret keys
//   //     apiSecretKey: 'xxxx',
//   //     // Registered Callback URLs in TwitterApp
//   //     // Android is a deeplink
//   //     // iOS is a URLScheme
//   //     redirectURI: 'example://',
//   //   );
//   //   final _result = await twitterLogin.login();
//   //   final _twitterAuthCredential =
//   //   TwitterAuthProvider.credential(accessToken: _result.authToken!, secret: _result.authTokenSecret!);
//   //   final SocialAuthModel _model = SocialAuthModel();
//   //   UserCredential _user = await FirebaseAuth.instance.signInWithCredential(_twitterAuthCredential);
//   //   _model.statusCode = 200;
//   //   _model.message = "success";
//   //   _model.id = _user.user?.uid;
//   //   _model.accessToken = _user.credential?.accessToken;
//   //   _model.idToken = _user.user?.refreshToken;
//   //   _model.name = _user.user?.displayName;
//   //   _model.image = _user.user?.photoURL;
//   //   _model.email = _user.user?.email;
//   //   _model.password = _user.user?.uid;
//   //   _model.printData();
//   //   return _model;
//   // }
//
//   static Future<SocialAuthModel> loginWithApple() async {
//     try{
//       final appleProvider = AppleAuthProvider();
//       final _user = await FirebaseAuth.instance.signInWithProvider(appleProvider);
//
//       final SocialAuthModel _model = SocialAuthModel();
//       _model.statusCode = 200;
//       _model.message = "success";
//       _model.id = _user.user?.uid;
//       _model.accessToken = _user.credential?.accessToken;
//       _model.idToken = _user.credential!.token.toString();
//       _model.name = _user.user?.displayName;
//       _model.image = _user.user?.photoURL;
//       _model.email = _user.user?.email;
//       _model.password = _user.user?.uid;
//       _model.printData();
//       return _model;
//     } catch (e){
//       final SocialAuthModel _model = SocialAuthModel();
//       print("EEEEEEEEEE $e");
//       _model.statusCode = 401;
//       _model.message = "$e";
//       return _model;
//     }
//   }
//
//   void googleSignOut() async {
//     await GoogleSignIn().disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }