import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final String stackTrace; //Log debug
  const Failure({required this.message, required this.stackTrace});

  @override
  List<Object> get props => [message, stackTrace];
}

class DataBaseFailure extends Failure {
  const DataBaseFailure({required super.message, required super.stackTrace});
}

class ServerException extends Equatable implements Exception {
  @override
  List<Object?> get props => [];
}
