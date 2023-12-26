part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();
}

class ImageUploadInitial extends ImageUploadEvent {
  @override
  List<Object?> get props => [];
}

class InitializeValues extends ImageUploadEvent {
  const InitializeValues();

  @override
  List<Object?> get props => [];
}

class StoreLocalProfileImage extends ImageUploadEvent {
  final File? image;

  const StoreLocalProfileImage(this.image);

  @override
  List<Object?> get props => [image];
}

class ImagePickEvent extends ImageUploadEvent {
  const ImagePickEvent();

  @override
  List<Object?> get props => [];
}

class MediaPickEvent extends ImageUploadEvent {
  const MediaPickEvent();

  @override
  List<Object?> get props => [];
}
