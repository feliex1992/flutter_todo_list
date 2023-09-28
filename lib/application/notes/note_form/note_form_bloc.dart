import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_todo_list/domain/notes/i_note_repository.dart';
import 'package:flutter_todo_list/domain/notes/note.dart';
import 'package:flutter_todo_list/domain/notes/note_failure.dart';
import 'package:flutter_todo_list/domain/notes/value_objects.dart';
import 'package:flutter_todo_list/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) async {
      if (event is _Initialized) {
        emit(event.initialNoteOption.fold(
          () => NoteFormState.initial(),
          (initialNote) => NoteFormState.initial().copyWith(
            note: initialNote,
            isEditing: true,
          ),
        ));
      } else if (event is _BodyChanged) {
        emit(NoteFormState.initial().copyWith(
          note: NoteFormState.initial().note.copyWith(
                body: NoteBody(event.bodyStr),
              ),
          saveFailureOrSuccessOption: none(),
        ));
      } else if (event is _ColorChanged) {
        emit(NoteFormState.initial().copyWith(
          note: NoteFormState.initial()
              .note
              .copyWith(color: NoteColor(event.color)),
          saveFailureOrSuccessOption: none(),
        ));
      } else if (event is _TodosChanged) {
        emit(NoteFormState.initial().copyWith(
          note: NoteFormState.initial().note.copyWith(
                todos:
                    List3(event.todos.map((primitive) => primitive.toDomain())),
              ),
          saveFailureOrSuccessOption: none(),
        ));
      } else if (event is _Saved) {
        Either<NoteFailure, Unit>? failureOrSuccess;

        emit(NoteFormState.initial().copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        ));

        if (NoteFormState.initial().note.failureOption.isNone()) {
          failureOrSuccess = NoteFormState.initial().isEditing
              ? await _noteRepository.update(NoteFormState.initial().note)
              : await _noteRepository.create(NoteFormState.initial().note);
        }

        emit(NoteFormState.initial().copyWith(
          isSaving: false,
          showErrorMessages: true,
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        ));
      }
    });
  }
}
