import 'package:equatable/equatable.dart';

class GitPr extends Equatable {
  final String pullURL;
  final String title;
  final String authorName;
  final String authorAvatarURL;
  final String body;
  final DateTime createdAt;

  const GitPr(
      {required this.pullURL,
      required this.title,
      required this.authorName,
      required this.authorAvatarURL,
      required this.body,
      required this.createdAt});

  @override
  List<Object?> get props => [
        pullURL,
        title,
        authorName,
        authorAvatarURL,
        body,
        createdAt,
      ];
}
