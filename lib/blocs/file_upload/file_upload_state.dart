part of 'file_upload_bloc.dart';

class FileUploadState extends Equatable {
  final File? file;
  final bool? hasLocalFile;

  const FileUploadState({this.file, this.hasLocalFile});

  @override
  List<Object?> get props => [file, hasLocalFile];

  FileUploadState copyWith({
    final File? file,
    final bool? hasLocalFile,
  }) {
    return FileUploadState(
      file: file ?? this.file,
      hasLocalFile: hasLocalFile ?? this.hasLocalFile,
    );
  }

  factory FileUploadState.initial() {
    return const FileUploadState(file: null, hasLocalFile: false);
  }
}
