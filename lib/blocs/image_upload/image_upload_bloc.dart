import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/services/image_picker_service.dart';
import '../../dependencies/dependency_manager.dart';

part 'image_upload_state.dart';
part 'image_upload_event.dart';

/// To open the image picker and store the file locally
/// context.read<ImageUploadBloc>().add(const MediaPickEvent());
/// context.read<ImagePickEvent>().add(const MediaPickEvent());
/// if (state.hasLocalFile) { you can access state.file }
/// 
/// 
class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  final ImagePickerService _imagePickerService = sl<ImagePickerService>();

  ImageUploadBloc() : super(ImageUploadState.initial()) {
    on<StoreLocalProfileImage>(_storeLocalProfileImage);
    on<InitializeValues>(_onInitializeValues);
    on<ImagePickEvent>(_onPickImage);
    on<MediaPickEvent>(_onPickMedia);
  }

  FutureOr<void> _storeLocalProfileImage(
      StoreLocalProfileImage event, Emitter<ImageUploadState> emit) async {
    emit(state.copyWith(
      image: event.image,
      hasLocalProfileImage: true,
    ));
  }

  FutureOr<void> _onInitializeValues(
      InitializeValues event, Emitter<ImageUploadState> emit) {
    emit(state.copyWith(
      hasLocalProfileImage: false,
      image: File(''),
    ));
  }

  FutureOr<void> _onPickMedia(
      MediaPickEvent event, Emitter<ImageUploadState> emit) async {
    File? image = await _imagePickerService.pickMedia();
    if (image != null) {
      add(StoreLocalProfileImage(image));
    }
  }

  FutureOr<void> _onPickImage(
      ImagePickEvent event, Emitter<ImageUploadState> emit) async {
    File? image = await _imagePickerService.pickImage();
    if (image != null) {
      add(StoreLocalProfileImage(image));
    }
  }
}
