part of 'image_upload_bloc.dart';

class ImageUploadState extends Equatable {
  final File? image;
  final bool? hasLocalProfileImage;

  const ImageUploadState({this.image, this.hasLocalProfileImage});

  @override
  List<Object?> get props => [image, hasLocalProfileImage];

  ImageUploadState copyWith({
    final File? image,
    final bool? hasLocalProfileImage,
  }) {
    return ImageUploadState(
      image: image ?? image,
      hasLocalProfileImage: hasLocalProfileImage ?? hasLocalProfileImage,
    );
  }

  factory ImageUploadState.initial() {
    return const ImageUploadState(image: null, hasLocalProfileImage: false);
  }
}
