import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:core/core/bloc/git_rep_event.dart';
import 'package:core/core/bloc/git_rep_state.dart';
import 'package:core/core/params/no_params.dart';
import 'package:core/domain/usecases/get_git_rep_use_case.dart';

class GitRepBloc extends Bloc<GitRepEvent, GitRepState> {
  final GetGitRepUseCase useCase;
  GitRepBloc({required this.useCase}) : super(GitRepStateNotLoaded()) {
    on<GitRepLoadEvent>(_onLoadGitRep);
  }

  FutureOr<void> _onLoadGitRep(
      GitRepLoadEvent event, Emitter<GitRepState> emit) async {
    var result = await useCase(NoParams());
    result.fold((l) => emit(GitRepStateError(error: l)), (r) {
      if (r.isEmpty) {
        emit(GitRepStateEmpty());
      } else {
        emit(GitRepStateLoaded(gitReps: r));
      }
    });
  }
}
