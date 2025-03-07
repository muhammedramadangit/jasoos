import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';
import 'package:jasoos/utiltiy/utility.dart';

abstract class ImagePickerHelper {
  static Future<void> showOption({ValueChanged<File>? onGet, bool compress = false}) async{
    showCupertinoModalPopup(
      context: CustomNavigator.navigatorState.currentContext!,
      builder: (_) {
        return CupertinoActionSheet(
          title: Text("Choose your image", style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.GREY_TEXT_COLOR)),
          actions: [
            CupertinoActionSheetAction(
                onPressed: () async {
                  openCamera(onGet: onGet, compress: compress);
                },
                child: Text("Camera")),
            CupertinoActionSheetAction(
                onPressed: () async {
                  CustomNavigator.pop();
                  openGallery(onGet: onGet);
                },
                child: Text("Gallery"))
          ],
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                CustomNavigator.pop();
              },
              child: Text("Cancel", style: TextStyle(color: Colors.red))),
        );
      },
    );
  }

  static Future<XFile?> openGallery({ValueChanged<File>? onGet}) async {
    String? path = (await ImagePicker().pickImage(source: ImageSource.gallery))?.path;
    if(path == null) return null;
    XFile? _image = XFile(path);
    onGet?.call(File(_image.path));
    return _image;
  }

  static openCamera({ValueChanged<File>? onGet, bool compress = false}) async {
    CustomNavigator.pop();
    var _image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (compress) {
      File? _imageCompress = await Utility.compressImage(File(_image!.path));
      onGet?.call(File(_imageCompress.path));
    } else {
      onGet?.call(File(_image!.path));
    }
  }
}
