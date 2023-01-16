import 'package:equatable/equatable.dart';

class GitRepParams extends Equatable {
  final int id;
  const GitRepParams({required this.id});

  @override
  List<Object?> get props => [id];
}
