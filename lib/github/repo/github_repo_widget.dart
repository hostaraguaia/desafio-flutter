import 'package:flutter/material.dart';

import '../../theme/theme_app.dart';
import '../user/github_user_widget.dart';
import 'github_repo_model.dart';

class GithubRepoWidget extends StatelessWidget {
  const GithubRepoWidget({
    super.key,
    required this.repo,
    required this.routeChild,
  });

  final GithubRepoModel repo;
  final Widget routeChild;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => routeChild)),
      child: Container(
        padding: const EdgeInsets.all(ThemeApp.padding),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    repo.name,
                    style: TextStyle(
                      color: Colors.blue[700],
                      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    repo.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    ),
                  ),
                  const SizedBox(height: ThemeApp.verticalSpacer),
                  Row(
                    children: [
                      const Icon(
                        Icons.share,
                        color: Colors.amber,
                      ),
                      Text(
                        repo.forks,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: ThemeApp.horizontalSpacer * 3),
                      const Icon(
                        Icons.grade,
                        color: Colors.amber,
                      ),
                      Text(
                        repo.stars,
                        style: const TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GithubUserWidget(
              user: repo.user,
            ),
          ],
        ),
      ),
    );
  }
}
