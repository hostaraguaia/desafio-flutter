import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_app.dart';
import '../pull/github_pull_page.dart';
import '../pull/list/github_pull_list_cubit.dart';
import 'github_repo_widget.dart';
import 'list/github_repo_list_cubit.dart';
import 'list/github_repo_list_input.dart';
import 'list/github_repo_list_state.dart';

class GithubRepoPage extends StatefulWidget {
  const GithubRepoPage(
    this.githubRepoListCubit,
    this.githubPullListCubit, {
    super.key,
    required this.title,
  });

  final GithubRepoListCubit githubRepoListCubit;
  final GithubPullListCubit githubPullListCubit;
  final String title;

  @override
  State<GithubRepoPage> createState() => _GithubRepoPageState();
}

class _GithubRepoPageState extends State<GithubRepoPage> {
  @override
  void initState() {
    widget.githubRepoListCubit.execute(const GithubRepoListInput('dart', '10', '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(ThemeApp.padding),
            color: Colors.black.withOpacity(0.05),
            child: Row(
              children: [
                ActionChip(
                  label: const Text('Dart'),
                  onPressed: () => widget.githubRepoListCubit.execute(const GithubRepoListInput('dart', '10', '1')),
                  backgroundColor: Colors.blueAccent,
                ),
                const SizedBox(width: ThemeApp.horizontalSpacer),
                ActionChip(
                  label: const Text('Java'),
                  onPressed: () => widget.githubRepoListCubit.execute(const GithubRepoListInput('java', '10', '1')),
                  backgroundColor: Colors.orangeAccent,
                ),
                const SizedBox(width: ThemeApp.horizontalSpacer),
                ActionChip(
                  label: const Text('Kotlin'),
                  onPressed: () => widget.githubRepoListCubit.execute(const GithubRepoListInput('kotlin', '10', '1')),
                  backgroundColor: Colors.purpleAccent,
                ),
                const SizedBox(width: ThemeApp.horizontalSpacer),
                ActionChip(
                  label: const Text('Swift'),
                  onPressed: () => widget.githubRepoListCubit.execute(const GithubRepoListInput('swift', '10', '1')),
                  backgroundColor: Colors.redAccent,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GithubRepoListCubit, GithubRepoListState>(
              bloc: widget.githubRepoListCubit,
              builder: (context, state) {
                if (state.isLoading) return const Center(child: CircularProgressIndicator());
                if (state.isFailure) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      const SizedBox(height: ThemeApp.verticalSpacer),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.replay_outlined),
                        label: const Text('Tentar novamente'),
                        onPressed: () => widget.githubRepoListCubit.execute(const GithubRepoListInput('dart', '10', '1')),
                      )
                    ],
                  );
                }
                return ListView.builder(
                  itemCount: state.output.repos.length,
                  itemBuilder: (context, index) => GithubRepoWidget(
                    repo: state.output.repos[index],
                    routeChild: GithubPullPage(
                      widget.githubPullListCubit,
                      repo: state.output.repos[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
