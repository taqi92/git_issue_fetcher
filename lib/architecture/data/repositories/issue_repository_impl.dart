
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/issue.dart';
import '../../domain/repositories/issue_repository.dart';
import '../datasources/remote_data_source.dart';
import '../failure.dart';


class IssueRepositoryImpl implements IssueRepository {

  //final Dio dio;

  //IssueRepositoryImpl(this.dio);

  final RemoteDataSource remoteDataSource;

  IssueRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<Issue>>> getOpenIssues(int page) async {
    try {
      /*final response = await dio.get(
        "https://api.github.com/repos/flutter/flutter/issues",
        queryParameters: {
          "state": "open",
          "page": page,
          "per_page": perPage,
        },
      );*/

      final response = await remoteDataSource.getCurrentIssues(page);

      final List<dynamic> data = response as List;
      final issues = data
          .map((json) => Issue(id: json['id'], title: json['title'], body: json['body']))
          .toList();
      return Right(issues);
    } on DioError catch (error) {
      return Left(error.message);
    }
  }

  /*@override
  Future<Either<Failure, Weather>> getCurrentWeather(int pageNumber) async {
    try {
      final result = await remoteDataSource.getCurrentIssues(pageNumber);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }*/

}
