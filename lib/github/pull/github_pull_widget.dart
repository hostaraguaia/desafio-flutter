import 'package:flutter/material.dart';

import '../../theme/theme_app.dart';
import '../user/github_user_widget.dart';
import 'github_pull_model.dart';

class GithubPullWidget extends StatelessWidget {
  const GithubPullWidget({
    super.key,
    required this.pull,
  });

  final GithubPullModel pull;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ThemeApp.padding),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pull.title,
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  pull.body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  softWrap: false,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                  ),
                ),
              ],
            ),
          ),
          GithubUserWidget(
            user: pull.user,
          ),
        ],
      ),
    );
  }
}
