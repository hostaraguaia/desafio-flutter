import 'package:app/utils/injection.dart';
import 'package:app/widgets/git_rep_list_item.dart';
import 'package:core/core/bloc/git_rep_bloc.dart';
import 'package:core/core/bloc/git_rep_event.dart';
import 'package:core/core/bloc/git_rep_state.dart';
import 'package:core/domain/entities/git_rep.dart';
import 'package:core/domain/repositories/git_rep_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//class HomePage extends StatefulWidget {
//  const HomePage({Key? key}) : super(key: key);
//
//  @override
//  State<HomePage> createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//  List<GitRepModel> models = <GitRepModel>[];
//
//  Future<void> searchRepositories() async {
//    var response = await http.get(Uri.parse(
//        "https://api.github.com/search/repositories?q=flutter&page=0&per_page=10"));
//    var data = jsonDecode(response.body);
//    setState(() {
//      models =
//          (data['items'] as List).map((e) => GitRepModel.fromJson(e)).toList();
//      models.forEach((element) {
//        print(element.name);
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: TextButton(
//          child: Text('texto'),
//          onPressed: () {
//            searchRepositories();
//          },
//        ),
//      ),
//    );
//  }
//}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GitRepBloc bloc;
  late final GitRepRepository repository;

  @override
  void initState() {
    bloc = getIt<GitRepBloc>();
    bloc.add(GitRepLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocBuilder(
            bloc: getIt<GitRepBloc>(),
            builder: (context, state) {
              if (state is GitRepStateEmpty) {
                const Text('Nenhum repositório Encontrado!');
              } else if (state is GitRepStateNotLoaded) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GitRepStateError) {
                return const Text('Erro: {state.error}');
              } else if (state is GitRepStateLoaded) {
                List<GitRep> reps = state.gitReps;
                return Column(
                  children: [
                    ListView.builder(
                      itemCount: reps.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return GitRepListItem(gitRep: reps[index]);
                      }),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
