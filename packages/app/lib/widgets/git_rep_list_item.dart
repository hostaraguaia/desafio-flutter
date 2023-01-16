import 'package:core/domain/entities/git_rep.dart';
import 'package:flutter/material.dart';

class GitRepListItem extends StatelessWidget {
  final GitRep gitRep;
  const GitRepListItem({Key? key, required this.gitRep}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          children: [
            Text('Nome: ${gitRep.name}'),
            Text('Descrição: ${gitRep.description}'),
            Text('User: ${gitRep.userName}'),
            Text('AvatarURL: ${gitRep.avatarURL}'),
            Text('URL: ${gitRep.htmlURL}'),
            Text('Stars: ${gitRep.starCount}'),
            Text('Forks: ${gitRep.fork}'),
          ],
        ),
      ),
    );
  }
}
