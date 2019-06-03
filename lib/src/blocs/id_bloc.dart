import 'package:bloc/bloc.dart';
import 'package:energized_id/energized_id.dart';

import '../repositories/student_repository.dart';

class IdEvent {}

class UpdateEvent extends IdEvent {
  final Student studentInfo;
  UpdateEvent(this.studentInfo);
}

class LoadEvent extends IdEvent {}

class SaveEvent extends IdEvent {}

class UploadImageEvent extends IdEvent {
  final List<int> imageData;
  UploadImageEvent(this.imageData);
}

class IdState {
  final Student studentInfo;
  final List<int> imageData;
  final String statusMessage;
  final String errorMessage;
  IdState(
      {this.studentInfo,
      this.imageData,
      this.statusMessage,
      this.errorMessage});
}

class IdBloc extends Bloc<IdEvent, IdState> {
  final StudentRepository _studentRepository;
  IdBloc(this._studentRepository);

  @override
  IdState get initialState =>
      IdState(studentInfo: StudentRepository.defaultStudent);

  @override
  Stream<IdState> mapEventToState(IdEvent event) async* {
    final previousState = currentState;
    if (event is UpdateEvent) {
      yield IdState(
          studentInfo: event.studentInfo, imageData: previousState.imageData);
    } else if (event is LoadEvent) {
      yield IdState(
          studentInfo: previousState.studentInfo,
          imageData: previousState.imageData,
          statusMessage: "Loading...");
      try {
        var studentInfo =
            await _studentRepository.getStudent(previousState.studentInfo.id);
        yield IdState(
            studentInfo: studentInfo, statusMessage: "Loading image...");
        try {
          var imageData = await _studentRepository
              .getStudentImage(previousState.studentInfo.id);
          yield IdState(studentInfo: studentInfo, imageData: imageData);
        } on String catch (msg) {
          yield IdState(studentInfo: studentInfo, errorMessage: msg);
        }
      } on String catch (msg) {
        yield IdState(
            studentInfo: previousState.studentInfo,
            imageData: previousState.imageData,
            errorMessage: msg);
      }
    } else if (event is SaveEvent) {
      yield IdState(
          studentInfo: previousState.studentInfo,
          imageData: previousState.imageData,
          statusMessage: "Saving...");
      try {
        await _studentRepository.putStudent(previousState.studentInfo);
        yield IdState(
            studentInfo: previousState.studentInfo,
            imageData: previousState.imageData,
            statusMessage: "Saved");
      } on String catch (msg) {
        yield IdState(
            studentInfo: previousState.studentInfo,
            imageData: previousState.imageData,
            errorMessage: msg);
      }
    } else if (event is UploadImageEvent) {
      yield IdState(
          studentInfo: previousState.studentInfo,
          imageData: previousState.imageData,
          statusMessage: "Uploading...");
      try {
        await _studentRepository.putStudentImage(
            event.imageData, previousState.studentInfo.id);
        yield IdState(
            studentInfo: previousState.studentInfo,
            imageData: event.imageData,
            statusMessage: "Image uploaded");
      } on String catch (msg) {
        yield IdState(
            studentInfo: previousState.studentInfo,
            imageData: event.imageData,
            errorMessage: msg);
      }
    }
  }
}
