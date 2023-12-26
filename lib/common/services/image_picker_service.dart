import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../themes/app_colors.dart';
import 'media_naming_service.dart';

class ImagePickerService {
  final MediaNamingService _mediaNamingService;

  ImagePickerService(this._mediaNamingService);

  final ImagePicker picker = ImagePicker();

  Future<File?> pickMedia() async {
    final pickedFile = await picker.pickMedia();
    if (pickedFile == null) return null;

    String fileExtension = pickedFile.path.split('.').last.toLowerCase();
    String newName;
    File fileToReturn;

    if (['jpg', 'jpeg', 'png', 'heic'].contains(fileExtension)) {
      // It's an image, proceed to crop
      ImageCropper cropper = ImageCropper();
      final croppedFile = await cropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: AppColors.kPrimaryColor,
              toolbarWidgetColor: AppColors.kWhiteColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile == null) return null;

      // Rename the cropped image
      newName = _mediaNamingService.generateImageName(fileExtension);
      fileToReturn = File(croppedFile.path);
    } else {
      // For other file types like videos
      switch (fileExtension) {
        case 'mp4':
        case 'avi':
        case 'mov':
        case 'mkv':
          // It's a video
          newName = _mediaNamingService.generateVideoName(fileExtension);
          break;
        default:
          // Handle other file types if necessary
          newName =
              'file${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
          break;
      }
      fileToReturn = File(pickedFile.path);
    }

    // Rename and return the file
    final directory = Directory(fileToReturn.path).parent.path;
    final newPath = '$directory/$newName';
    return fileToReturn.rename(newPath);
  }

  Future<File?> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    String fileExtension = pickedFile.path.split('.').last.toLowerCase();
    String newName;
    File fileToReturn;

    if (['jpg', 'jpeg', 'png', 'heic'].contains(fileExtension)) {
      // It's an image, proceed to crop
      ImageCropper cropper = ImageCropper();
      final croppedFile = await cropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatioPresets: [CropAspectRatioPreset.ratio16x9],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: AppColors.kPrimaryColor,
              toolbarWidgetColor: AppColors.kWhiteColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if (croppedFile == null) return null;

      // Rename the cropped image
      newName = _mediaNamingService.generateImageName(fileExtension);
      fileToReturn = File(croppedFile.path);
    } else {
      // For other file types like videos
      switch (fileExtension) {
        case 'mp4':
        case 'avi':
        case 'mov':
        case 'mkv':
          // It's a video
          newName = _mediaNamingService.generateVideoName(fileExtension);
          break;
        default:
          // Handle other file types if necessary
          newName =
              'file${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
          break;
      }
      fileToReturn = File(pickedFile.path);
    }

    // Rename and return the file
    final directory = Directory(fileToReturn.path).parent.path;
    final newPath = '$directory/$newName';
    return fileToReturn.rename(newPath);
  }
}
