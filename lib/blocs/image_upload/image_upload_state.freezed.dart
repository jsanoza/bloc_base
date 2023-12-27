// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_upload_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ImageUploadState {
  File? get image => throw _privateConstructorUsedError;
  bool? get hasLocalProfileImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageUploadStateCopyWith<ImageUploadState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadStateCopyWith<$Res> {
  factory $ImageUploadStateCopyWith(
          ImageUploadState value, $Res Function(ImageUploadState) then) =
      _$ImageUploadStateCopyWithImpl<$Res, ImageUploadState>;
  @useResult
  $Res call({File? image, bool? hasLocalProfileImage});
}

/// @nodoc
class _$ImageUploadStateCopyWithImpl<$Res, $Val extends ImageUploadState>
    implements $ImageUploadStateCopyWith<$Res> {
  _$ImageUploadStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? hasLocalProfileImage = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      hasLocalProfileImage: freezed == hasLocalProfileImage
          ? _value.hasLocalProfileImage
          : hasLocalProfileImage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageUploadStateImplCopyWith<$Res>
    implements $ImageUploadStateCopyWith<$Res> {
  factory _$$ImageUploadStateImplCopyWith(_$ImageUploadStateImpl value,
          $Res Function(_$ImageUploadStateImpl) then) =
      __$$ImageUploadStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({File? image, bool? hasLocalProfileImage});
}

/// @nodoc
class __$$ImageUploadStateImplCopyWithImpl<$Res>
    extends _$ImageUploadStateCopyWithImpl<$Res, _$ImageUploadStateImpl>
    implements _$$ImageUploadStateImplCopyWith<$Res> {
  __$$ImageUploadStateImplCopyWithImpl(_$ImageUploadStateImpl _value,
      $Res Function(_$ImageUploadStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? hasLocalProfileImage = freezed,
  }) {
    return _then(_$ImageUploadStateImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as File?,
      hasLocalProfileImage: freezed == hasLocalProfileImage
          ? _value.hasLocalProfileImage
          : hasLocalProfileImage // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$ImageUploadStateImpl implements _ImageUploadState {
  const _$ImageUploadStateImpl({this.image, this.hasLocalProfileImage});

  @override
  final File? image;
  @override
  final bool? hasLocalProfileImage;

  @override
  String toString() {
    return 'ImageUploadState(image: $image, hasLocalProfileImage: $hasLocalProfileImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageUploadStateImpl &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.hasLocalProfileImage, hasLocalProfileImage) ||
                other.hasLocalProfileImage == hasLocalProfileImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image, hasLocalProfileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageUploadStateImplCopyWith<_$ImageUploadStateImpl> get copyWith =>
      __$$ImageUploadStateImplCopyWithImpl<_$ImageUploadStateImpl>(
          this, _$identity);
}

abstract class _ImageUploadState implements ImageUploadState {
  const factory _ImageUploadState(
      {final File? image,
      final bool? hasLocalProfileImage}) = _$ImageUploadStateImpl;

  @override
  File? get image;
  @override
  bool? get hasLocalProfileImage;
  @override
  @JsonKey(ignore: true)
  _$$ImageUploadStateImplCopyWith<_$ImageUploadStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
