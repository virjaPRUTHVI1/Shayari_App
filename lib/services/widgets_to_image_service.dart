// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:widgets_to_image/widgets_to_image.dart';
//
// class WidgetsToImageService {
//   Future<String> makeImage(
//     WidgetsToImageController controller, {//provide by widgets to image package
//     required String filePath,
//   }) async {
//     Uint8List? bytes = await controller.capture();//widgets as a image...
//     File imageFile = File(filePath);
//     print(bytes);
//
//     imageFile.writeAsBytesSync(bytes as List<int>);
//
//
//     return (await imageFile.create()).path;
//   }
// }
//

import 'dart:io';
import 'dart:typed_data';

import 'package:widgets_to_image/widgets_to_image.dart';


class WidgetsToImageService {
  Future<String> makeImage(
      WidgetsToImageController controller, {
        required String filePath,
      }) async {
    // Capture the widget as an image (Uint8List).
    Uint8List? bytes = await controller.capture();

    /// If the capture failed, throw an exception.
    if (bytes == null) {
      throw Exception("Failed to capture widget as image.");
    }

    // Create the file and write the image bytes to it.
    File imageFile = File(filePath);
    await imageFile.writeAsBytes(bytes);

    /// Return the file path after creating the image file.
    return imageFile.path;
  }
}

