// import 'dart:io';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:student_guide/helper/styles.dart';
// import 'package:student_guide/navigation/custom_navigation.dart';
// import 'package:student_guide/utiltiy/utility.dart';
//
// abstract class ImagePickerHelper {
//   static Future<void> showOption({ValueChanged<File>? onGet, bool compress = false}) async{
//     showCupertinoModalPopup(
//       context: CustomNavigator.navigatorState.currentContext!,
//       builder: (_) {
//         return CupertinoActionSheet(
//           title: Text("Choose your image", style: Styles.CONTENT_STYLE),
//           actions: [
//             CupertinoActionSheetAction(
//                 onPressed: () async {
//                   openCamera(onGet: onGet, compress: compress);
//                 },
//                 child: Text("Camera")),
//             CupertinoActionSheetAction(
//                 onPressed: () async {
//                   CustomNavigator.pop();
//                   openGallery(onGet: onGet, compress: compress);
//                 },
//                 child: Text("Gallery"))
//           ],
//           cancelButton: CupertinoActionSheetAction(
//               onPressed: () {
//                 CustomNavigator.pop();
//               },
//               child: Text("Cancel", style: TextStyle(color: Colors.red))),
//         );
//       },
//     );
//   }
//
//   static Future<File?> openGallery({ValueChanged<File>? onGet, bool compress = false}) async {
//     String? path = (await ImagePicker().pickImage(source: ImageSource.gallery))?.path;
//     if(path == null) return null;
//     File? _image = File(path);
//     if (compress) {
//       File? _imageCompress = await Utility.compressImage(File(_image.path));
//       onGet?.call(File(_imageCompress.path));
//       return _imageCompress;
//     } else {
//       onGet?.call(File(_image.path));
//       return _image;
//     }
//   }
//
//   static openCamera({ValueChanged<File>? onGet, bool compress = false}) async {
//     CustomNavigator.pop();
//     var _image = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (compress) {
//       File? _imageCompress = await Utility.compressImage(File(_image!.path));
//       onGet?.call(File(_imageCompress.path));
//     } else {
//       onGet?.call(File(_image!.path));
//     }
//   }
// }
