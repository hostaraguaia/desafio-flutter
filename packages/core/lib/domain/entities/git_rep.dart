import 'package:equatable/equatable.dart';

class GitRep extends Equatable {
  final String name;
  final String description;
  final String userName;
  final String avatarURL;
  final String htmlURL;
  final int starCount;
  final int fork;

  const GitRep({
    required this.name,
    required this.description,
    required this.userName,
    required this.avatarURL,
    required this.htmlURL,
    required this.starCount,
    required this.fork,
  });

  @override
  List<Object?> get props =>
      [name, description, userName, avatarURL, htmlURL, starCount, fork];
}
