import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:video_compress/video_compress.dart';
import 'package:jasoos/helper/styles.dart';
import 'package:jasoos/helper/text_styles.dart';
import 'package:jasoos/navigation/custom_navigation.dart';

abstract class ImagePickerHelper {
  static Future<void> showOption({ValueChanged<File>? onGet, bool compress = false}) async {
    showCupertinoModalPopup(
      context: CustomNavigator.navigatorState.currentContext!,
      builder: (_) {
        return CupertinoActionSheet(
          title: Text(tr("chooseYourImage"),
              style: AppTextStyles.w500.copyWith(fontSize: 14, color: Styles.GREY_TEXT_COLOR)),
          actions: [
            CupertinoActionSheetAction(
                onPressed: () async {
                  CustomNavigator.pop();
                  await openCamera(onGet: onGet, compress: compress);
                },
                child: Text(tr("camera"))),
            CupertinoActionSheetAction(
                onPressed: () async {
                  CustomNavigator.pop();
                  await openGallery(onGet: onGet, compress: compress);
                },
                child: Text(tr("gallery")))
          ],
          cancelButton: CupertinoActionSheetAction(
              onPressed: () => CustomNavigator.pop(),
              child: Text(tr("cancel"), style: TextStyle(color: Colors.red))),
        );
      },
    );
  }

  static Future<XFile?> openGallery({ValueChanged<File>? onGet, bool compress = false}) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked == null) return null;

    XFile file = XFile(picked.path);

    if (compress) {
      final compressed = await _compressImage(file);
      if (compressed != null) file = compressed;
    }

    onGet?.call(File(file.path));
    return XFile(file.path);
  }

  static Future<XFile?> openCamera({ValueChanged<File>? onGet, bool compress = false}) async {
    final picked = await ImagePicker().pickImage(source: ImageSource.camera);
    if (picked == null) return null;

    XFile file = XFile(picked.path);

    if (compress) {
      final compressed = await _compressImage(file);
      if (compressed != null) file = compressed;
    }

    onGet?.call(File(file.path));
    return XFile(file.path);
  }

  static Future<XFile?> openVideoGallery({ValueChanged<File>? onGet, bool compress = false}) async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picked == null) return null;

    File file = File(picked.path);

    if (compress) {
      final compressed = await _compressVideo(file);
      if (compressed != null) file = compressed;
    }

    onGet?.call(file);
    return XFile(file.path);
  }

  static Future<XFile?> openVideoCamera({ValueChanged<File>? onGet, bool compress = false}) async {
    final picked = await ImagePicker().pickVideo(source: ImageSource.camera);
    if (picked == null) return null;

    File file = File(picked.path);

    if (compress) {
      final compressed = await _compressVideo(file);
      if (compressed != null) file = compressed;
    }

    onGet?.call(file);
    return XFile(file.path);
  }

  // Compress Image
  static Future<XFile?> _compressImage(XFile file) async {
    final targetPath = file.path.replaceFirst('.jpg', '_compressed.jpg');
    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      quality: 70,
    );
    return result;
  }

  // Compress Video
  static Future<File?> _compressVideo(File file) async {
    final info = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
    );
    return info?.file;
  }
}
