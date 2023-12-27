import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_upload_state.freezed.dart';

@freezed
class ImageUploadState with _$ImageUploadState {
  const factory ImageUploadState({
    File? image,
    bool? hasLocalProfileImage,
  }) = _ImageUploadState;

  factory ImageUploadState.initial() =>
      const ImageUploadState(image: null, hasLocalProfileImage: false);
}


// class NetworkState extends BlocState {
//   final bool isConnected;

//   const NetworkState({
//     this.isConnected = false,
//   });

//   @override
//   List<Object?> get props => [isConnected];

//   NetworkState copyWith({
//     final bool? isConnected,
//   }) {
//     return NetworkState(
//       isConnected: isConnected ?? this.isConnected,
//     );
//   }

//   factory NetworkState.initial() {
//     return const NetworkState(isConnected: false);
//   }
// }