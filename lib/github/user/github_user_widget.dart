import 'package:flutter/material.dart';

import '../../theme/theme_app.dart';
import 'github_user_model.dart';

class GithubUserWidget extends StatelessWidget {
  const GithubUserWidget({
    super.key,
    required this.user,
  });

  final GithubUserModel user;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.05),
            child: Padding(
              padding: const EdgeInsets.all(ThemeApp.padding / 4),
              child: ClipOval(
                child: Image.network(
                  user.avatarUrl,
                  loadingBuilder: (context, child, loadingProgress) => loadingProgress == null ? child : const CircularProgressIndicator(),
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.person),
                ),
              ),
            ),
          ),
          Text(
            user.username,
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            user.type,
            style: TextStyle(
              color: Colors.black54,
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
