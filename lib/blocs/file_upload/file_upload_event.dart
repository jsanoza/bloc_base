part of 'file_upload_bloc.dart';

abstract class FileUploadEvent extends Equatable {
  const FileUploadEvent();
}

class InitializeFileValues extends FileUploadEvent {
  const InitializeFileValues();

  @override
  List<Object?> get props => [];
}

class StoreLocalFile extends FileUploadEvent {
  final File? file;

  const StoreLocalFile(this.file);

  @override
  List<Object?> get props => [file];
}

class FilePickEvent extends FileUploadEvent {
  const FilePickEvent();

  @override
  List<Object?> get props => [];
}
