import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

abstract class ImagePickerHelper {
  static Future<void> showOption({ValueChanged<File>? onGet, bool compress = false}) async{
    showCupertinoModalPopup(
      context: CustomNavigator.navigatorState.currentContext!,
      builder: (_) {
        return CupertinoActionSheet(
          title: Text(tr("chooseYourImage"), style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.GREY_TEXT_COLOR)),
          actions: [
            CupertinoActionSheetAction(
                onPressed: () async {
                  CustomNavigator.pop();
                  openCamera(onGet: onGet, compress: compress);
                },
                child: Text(tr("camera"))),
            CupertinoActionSheetAction(
                onPressed: () async {
                  CustomNavigator.pop();
                  openGallery(onGet: onGet);
                },
                child: Text(tr("gallery")))
          ],
          cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                CustomNavigator.pop();
              },
              child: Text(tr("cancel"), style: TextStyle(color: Colors.red))),
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

  static Future<XFile?> openCamera({ValueChanged<File>? onGet, bool compress = false}) async {
    var _image = await ImagePicker().pickImage(source: ImageSource.camera);
    onGet?.call(File(_image!.path));
    return _image;
  }

  static Future<XFile?> openVideoGallery({ValueChanged<File>? onGet}) async {
    String? path = (await ImagePicker().pickVideo(source: ImageSource.gallery))?.path;
    if(path == null) return null;
    XFile? _video = XFile(path);
    onGet?.call(File(_video.path));
    return _video;
  }

  static Future<XFile?> openVideoCamera({ValueChanged<File>? onGet, bool compress = false}) async {
    var _video = await ImagePicker().pickVideo(source: ImageSource.camera);
    onGet?.call(File(_video!.path));
    return _video;
  }
}
