import 'dart:async';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController {
  ImagePicker imagePicker = ImagePicker();
  StreamController<XFile?> currentImage = StreamController<XFile?>();
  Stream<XFile?> get stream => currentImage.stream;

  Future<XFile?> getGalleryImage() async {
    final XFile? temporary =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (temporary != null) {
      final croppedImage = await cropImage(temporary);
      currentImage.sink.add(XFile(croppedImage.path));

      return XFile(croppedImage.path);
    } else {
      return null;
    }
  }

  Future<XFile?> getCameraImage() async {
    final XFile? temporary =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (temporary != null) {
      final croppedImage = await cropImage(temporary);
      currentImage.sink.add(XFile(croppedImage.path));
      return XFile(croppedImage.path);
    } else {
      return null;
    }
  }

  cropImage(XFile image) async {
    return await ImageCropper()
        .cropImage(sourcePath: image.path, aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ]);
  }
}
