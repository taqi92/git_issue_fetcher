// injection_container.dart

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'architecture/data/repositories/issue_repository_impl.dart';
import 'architecture/domain/repositories/issue_repository.dart';
import 'architecture/domain/use_case/issue_use_case.dart';


final getIt = GetIt.instance;

void setupInjectionContainer() {
  // Dio for network calls
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Repositories
  getIt.registerLazySingleton<IssueRepository>(() => IssueRepositoryImpl(getIt()));

  // Use Cases
  getIt.registerLazySingleton<IssueUseCase>(() => IssueUseCase(getIt<IssueRepository>()));
}
