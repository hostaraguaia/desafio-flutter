import 'package:equatable/equatable.dart';

class GitPrParams extends Equatable {
  final int id;
  const GitPrParams({required this.id});

  @override
  List<Object?> get props => [id];
}
