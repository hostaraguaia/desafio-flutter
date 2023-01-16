import 'package:equatable/equatable.dart';

abstract class GitRepEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GitRepLoadEvent extends GitRepEvent {}
