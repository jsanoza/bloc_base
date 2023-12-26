import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../common/services/file_picker_service.dart';
import '../../dependencies/dependency_manager.dart';
part 'file_upload_state.dart';
part 'file_upload_event.dart';

/// To open the file picker and store the file locally
/// context.read<FileUploadBloc>().add(const FilePickEvent());
/// if (state.hasLocalFile) { you can access state.file }

class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  final FilePickerService filePickerService = sl<FilePickerService>();

  FileUploadBloc() : super(FileUploadState.initial()) {
    on<StoreLocalFile>(_storeLocalFile);
    on<InitializeFileValues>(_onInitializeValues);
    on<FilePickEvent>(_onFilePick);
  }

  FutureOr<void> _storeLocalFile(
      StoreLocalFile event, Emitter<FileUploadState> emit) async {
    emit(state.copyWith(
      file: event.file,
      hasLocalFile: true,
    ));
  }

  FutureOr<void> _onInitializeValues(
      InitializeFileValues event, Emitter<FileUploadState> emit) {
    emit(state.copyWith(
      hasLocalFile: false,
      file: File(''),
    ));
  }

  FutureOr<void> _onFilePick(
      FilePickEvent event, Emitter<FileUploadState> emit) async {
    File? file = await filePickerService.pickAFile();
    if (file != null) {
      add(StoreLocalFile(file));
    }
  }
}
