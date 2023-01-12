import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/theme_app.dart';
import '../repo/github_repo_model.dart';
import 'github_pull_widget.dart';
import 'list/github_pull_list_cubit.dart';
import 'list/github_pull_list_input.dart';
import 'list/github_pull_list_state.dart';

class GithubPullPage extends StatefulWidget {
  const GithubPullPage(
    this.githubPullListCubit, {
    super.key,
    required this.repo,
  });

  final GithubPullListCubit githubPullListCubit;
  final GithubRepoModel repo;

  @override
  State<GithubPullPage> createState() => _GithubPullPageState();
}

class _GithubPullPageState extends State<GithubPullPage> {
  @override
  void initState() {
    widget.githubPullListCubit.execute(GithubPullListInput(widget.repo.name, 'open', '10', '1'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.repo.name),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(ThemeApp.padding),
            color: Colors.black.withOpacity(0.05),
            child: Row(
              children: [
                ActionChip(
                  label: const Text('Opened Pulls'),
                  onPressed: () => widget.githubPullListCubit.execute(GithubPullListInput(widget.repo.name, 'open', '10', '1')),
                  backgroundColor: Colors.greenAccent,
                ),
                const SizedBox(width: ThemeApp.horizontalSpacer),
                ActionChip(
                  label: const Text('Closed Pulls'),
                  onPressed: () => widget.githubPullListCubit.execute(GithubPullListInput(widget.repo.name, 'closed', '10', '1')),
                  backgroundColor: Colors.black.withOpacity(0.15),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<GithubPullListCubit, GithubPullListState>(
              bloc: widget.githubPullListCubit,
              builder: (context, state) {
                if (state.isLoading) return const Center(child: CircularProgressIndicator());
                if (state.isFailure) return Center(child: Text(state.message));
                return ListView.builder(
                  itemCount: state.output.pulls.length,
                  itemBuilder: (context, index) => GithubPullWidget(pull: state.output.pulls[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
