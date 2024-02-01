import 'package:get_it/get_it.dart';
import 'package:github_issue_fetcher/architecture/domain/use_case/issue_use_case.dart';
import 'package:github_issue_fetcher/architecture/presentation/blocs/issue_bloc.dart';

import 'architecture/data/datasources/remote_data_source.dart';
import 'architecture/data/repositories/issue_repository_impl.dart';
import 'architecture/domain/repositories/issue_repository.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

/*void setupInjectionContainer() {
  // Dio for network calls
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Repositories
  getIt.registerLazySingleton<IssueRepository>(() => IssueRepositoryImpl(getIt<Dio>()));
}*/


void init() {
  // bloc
  getIt.registerFactory(() => IssueBloc(getIt()));

  // usecase
  getIt.registerLazySingleton(() => IssueUseCase(getIt()));

  // repository
  getIt.registerLazySingleton<IssueRepository>(
        () => IssueRepositoryImpl(
      remoteDataSource: getIt(),
    ),
  );

  // data source
  getIt.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(
      client: getIt(),
    ),
  );

  // external
  getIt.registerLazySingleton(() => http.Client());
}
