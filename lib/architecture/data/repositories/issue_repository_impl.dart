// data/repositories/issue_repository_impl.dart

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/issue.dart';
import '../../domain/repositories/issue_repository.dart';

class IssueRepositoryImpl implements IssueRepository {
  final Dio dio;

  IssueRepositoryImpl(this.dio) {
    // Add interceptors for logging requests and responses
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, logPrint: print));
  }

  @override
  Future<Either<String, List<Issue>>> getOpenIssues(int page) async {
    try {
      final response = await dio.get(
        "https://api.github.com/repos/flutter/flutter/issues",
        queryParameters: {
          "state": "open",
          "page": 1,
          "per_page": 20,
        },
      );

      final List<dynamic> data = response.data;
      final issues = data
          .map((json) => Issue(id: json['id'], title: json['title']))
          .toList();
      return Right(issues);
    } on DioError catch (error) {
      // Print or log the Dio error
      log('DioError: $error');
      return Left(error.message);
    }
  }
}
