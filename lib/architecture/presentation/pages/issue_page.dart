import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_issue_fetcher/architecture/domain/use_case/issue_use_case.dart';

import '../../data/repositories/issue_repository_impl.dart';
import '../blocs/issue_bloc.dart';

class IssuePage extends StatelessWidget {
  //final IssueRepositoryImpl repository;

  //IssueUseCase useCase;

  //IssuePage({required this.useCase});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssueBloc, IssueState>(
      builder: (context, state) {
        if (state is IssueLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is IssueLoaded) {
          return ListView.builder(
            itemCount: state.issues.length,
            itemBuilder: (context, index) {
              final issue = state.issues[index];
              return ListTile(
                title: Text(issue.title),
                subtitle: Text(issue.body),
              );
            },
          );
        } else if (state is IssueError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return Center(child: Text('No data available.'));
        }
      },
    );
  }

/*@override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IssueBloc(useCase), // Inject the repository here
      child: Scaffold(
        appBar: AppBar(
          title: Text('GitHub Issues'),
        ),
        body: BlocBuilder<IssueBloc, IssueState>(
          builder: (context, state) {
            if (state is IssueLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is IssueLoaded) {
              return ListView.builder(
                itemCount: state.issues.length,
                itemBuilder: (context, index) {
                  final issue = state.issues[index];
                  return ListTile(
                    title: Text(issue.title),
                    subtitle: Text(issue.body),
                  );
                },
              );
            } else if (state is IssueError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return Center(child: Text('No data available.'));
            }
          },
        ),
      ),
    );
  }*/
}
