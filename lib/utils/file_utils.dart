class FileUtilities {
  static String determineFileType(String extension) {
    switch (extension.toLowerCase()) {
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
      case 'bmp':
      case 'webp':
      case 'heic':
        return 'image';
      case 'mov':
      case 'mp4':
      case 'avi':
      case 'wmv':
      case 'mkv':
        return 'video';
      case 'pdf':
        return 'pdf';
      default:
        return 'other';
    }
  }
}
