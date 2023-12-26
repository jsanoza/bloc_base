class MediaNamingService {
  int _imageCounter = 0;
  int _videoCounter = 0;
  int _pdfCounter = 0;

  String generateImageName(String extension) {
    _imageCounter++;
    return 'image${_imageCounter.toString().padLeft(2, '0')}.$extension';
  }

  String generateVideoName(String extension) {
    _videoCounter++;
    return 'video${_videoCounter.toString().padLeft(2, '0')}.$extension';
  }

  String generatePdfName() {
    _pdfCounter++;
    return 'pdf${_pdfCounter.toString().padLeft(2, '0')}.pdf';
  }
}
