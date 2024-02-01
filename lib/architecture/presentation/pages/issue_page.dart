import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_issue_fetcher/architecture/domain/use_case/issue_use_case.dart';

import '../../data/repositories/issue_repository_impl.dart';
import '../blocs/issue_bloc.dart';

class IssuePage extends StatelessWidget {

  //final IssueRepositoryImpl repository;

  IssueUseCase useCase;

  IssuePage({required this.useCase});


@override
  Widget build(BuildContext context) {

  final IssueBloc issueBloc = BlocProvider.of<IssueBloc>(context);

  // Add any logic for triggering the API call, for example, when the screen loads
  issueBloc.add(const GetOpenIssuesEvent(1));

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Issues'),
      ),
      body: BlocBuilder<IssueBloc, IssueState>(
        builder: (context, state) {
          if (state is IssueLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is IssueLoaded) {
            return ListView.builder(
              itemCount: state.issues.length,
              itemBuilder: (context, index) {
                final issue = state.issues[index];
                return ListTile(
                  title: Text(issue.title),
                  subtitle: Text(issue.id.toString()),
                );
              },
            );
          } else if (state is IssueError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
