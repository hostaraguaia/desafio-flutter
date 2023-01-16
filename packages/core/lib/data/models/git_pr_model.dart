import 'dart:convert';
import 'package:core/domain/entities/git_pr.dart';

class GitPrModel extends GitPr {
  const GitPrModel({
    required super.pullURL,
    required super.title,
    required super.authorName,
    required super.authorAvatarURL,
    required super.body,
    required super.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'pullURL': pullURL,
      'title': title,
      'authorName': authorName,
      'authorAvatarURL': authorAvatarURL,
      'body': body,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory GitPrModel.fromMap(Map<String, dynamic> map) {
    return GitPrModel(
      pullURL: map['pulls_url'] ?? '',
      title: map['title'] ?? '',
      authorName: map['authorName'] ?? '',
      authorAvatarURL: map['authorAvatarURL'] ?? '',
      body: map['body'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GitPrModel.fromJson(String source) =>
      GitPrModel.fromMap(json.decode(source));
}
