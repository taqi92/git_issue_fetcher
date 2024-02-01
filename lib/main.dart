// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:github_issue_fetcher/architecture/domain/use_case/issue_use_case.dart';

import 'architecture/data/repositories/issue_repository_impl.dart';
import 'architecture/presentation/blocs/issue_bloc.dart';
import 'architecture/presentation/pages/issue_page.dart';
import 'injection_container.dart';

void main() {
  setupInjectionContainer(); // Initialize dependency injection container
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Dio dio = getIt<Dio>(); // Retrieve Dio instance from the container
    final IssueRepositoryImpl repository = IssueRepositoryImpl(dio); // Instantiate the repository
    final IssueUseCase useCase = IssueUseCase(repository);
    final IssueBloc issueBloc = IssueBloc(useCase);

    return MaterialApp(
      title: 'GitHub Issues App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => issueBloc,
        child: IssuePage(useCase: useCase), // Pass the bloc to the IssuePage
      ), // Pass the repository to the IssuePage
    );
  }
}
