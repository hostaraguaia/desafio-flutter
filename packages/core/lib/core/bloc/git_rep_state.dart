import 'package:core/domain/entities/git_rep.dart';
import 'package:core/helpers/failure.dart';
import 'package:equatable/equatable.dart';

class GitRepState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GitRepStateLoaded extends GitRepState {
  final List<GitRep> gitReps;
  GitRepStateLoaded({required this.gitReps});
  @override
  List<Object?> get props => [gitReps];
}

class GitRepStateNotLoaded extends GitRepState {
  GitRepStateNotLoaded();
  @override
  List<Object?> get props => [];
}

class GitRepStateError extends GitRepState {
  final Failure error;
  GitRepStateError({required this.error});
  @override
  List<Object?> get props => [error];
}

class GitRepStateEmpty extends GitRepState {}
