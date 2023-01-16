import 'dart:convert';

import 'package:core/domain/entities/git_rep.dart';

class GitRepModel extends GitRep {
  const GitRepModel({
    required super.name,
    required super.description,
    required super.userName,
    required super.avatarURL,
    required super.htmlURL,
    required super.starCount,
    required super.fork,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'login': userName,
      'avatar_url': avatarURL,
      'html_url': htmlURL,
      'stargazers_count': starCount,
      'forks_count': fork,
    };
  }

  factory GitRepModel.fromMap(Map<String, dynamic> map) {
    return GitRepModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      userName: map['owner']['login'] ?? '',
      avatarURL: map['owner']['avatar_url'] ?? '',
      htmlURL: map['html_url'] ?? '',
      starCount: map['stargazers_count']?.toInt() ?? 0,
      fork: map['forks_count']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GitRepModel.fromJson(String source) =>
      GitRepModel.fromMap(json.decode(source));
}
