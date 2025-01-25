// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/cupertino.dart';
//
// abstract class FilePickerHelper {
//   static Future pickFile({
//     String title = "Pick a file",
//     FileType? type,
//     List<String>? allowedExtensions,
//     ValueChanged<File>? onSelected,
//     ValueChanged<List<File>>? onSelectedMulti,
//     bool multiImages = false,
//     bool isSingleFile = true,
//     Function()? onCanceld,
//   }) async {
//     var result = await FilePicker.platform.pickFiles(
//         type: type ?? FileType.any,
//         allowMultiple: multiImages,
//         dialogTitle: title,
//         allowedExtensions: allowedExtensions
//     );
//     if (result != null) {
//       List<File> files = [];
//
//       result.files.forEach((element) {
//         files.add(File(element.path!));
//       });
//       if (onSelectedMulti != null) onSelectedMulti(files);
//       if (onSelected != null) onSelected(files.first);
//       return isSingleFile? files.first : files;
//     } else {
//       onCanceld?.call();
//       return null;
//     }
//   }
// }
