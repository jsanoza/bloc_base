import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import '../../utils/file_utils.dart';
import 'media_naming_service.dart';

class FilePickerService {
  final MediaNamingService _mediaNamingService;
  FilePickerService(this._mediaNamingService);

  Future<File?> pickAFile() async {
    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles();
    if (pickerResult != null && pickerResult.files.single.path != null) {
      String path = pickerResult.files.single.path!;
      File originalFile = File(path);
      String extension = path.split('.').last.toLowerCase();
      log(extension.toString());
      String newName;

      switch (FileUtilities.determineFileType(extension)) {
        case 'image':
          newName = _mediaNamingService.generateImageName(extension);
          break;
        case 'video':
          newName = _mediaNamingService.generateVideoName(extension);
          break;
        case 'pdf':
          newName = _mediaNamingService.generatePdfName();
          break;
        default:
          newName = 'file${DateTime.now().millisecondsSinceEpoch}.$extension';
          break;
      }

      final directory = Directory(originalFile.path).parent.path;
      final newPath = '$directory/$newName';
      return originalFile.rename(newPath);
    }

    return null;
  }
}
