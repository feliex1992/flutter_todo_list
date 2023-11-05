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
      await event.map(
        initialized: (e) => _noteFormInit(e, emit),
        bodyChanged: (e) => _noteFormBodyChanged(e, emit),
        colorChanged: (e) => _noteFormColorChanged(e, emit),
        todosChanged: (e) => _noteFormTodosChanged(e, emit),
        saved: (_) => _noteFormSaved(emit),
      );
    });
  }

  _noteFormInit(_Initialized event, Emitter<NoteFormState> emit) async {
    emit(event.initialNoteOption.fold(
      () => NoteFormState.initial(),
      (initialNote) => state.copyWith(
        note: initialNote,
        isEditing: true,
      ),
    ));
  }

  _noteFormBodyChanged(_BodyChanged event, Emitter<NoteFormState> emit) async {
    emit(state.copyWith(
      note: state.note.copyWith(
        body: NoteBody(event.bodyStr),
      ),
      saveFailureOrSuccessOption: none(),
    ));
  }

  _noteFormColorChanged(
    _ColorChanged event,
    Emitter<NoteFormState> emit,
  ) async {
    emit(state.copyWith(
      note: state.note.copyWith(color: NoteColor(event.color)),
      saveFailureOrSuccessOption: none(),
    ));
  }

  _noteFormTodosChanged(
    _TodosChanged event,
    Emitter<NoteFormState> emit,
  ) async {
    emit(state.copyWith(
      note: state.note.copyWith(
        todos: List3(event.todos.map((primitive) => primitive.toDomain())),
      ),
      saveFailureOrSuccessOption: none(),
    ));
  }

  _noteFormSaved(Emitter<NoteFormState> emit) async {
    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    ));

    if (state.note.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _noteRepository.update(state.note)
          : await _noteRepository.create(state.note);
    }

    emit(state.copyWith(
      isSaving: false,
      showErrorMessages: true,
      saveFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }
}
