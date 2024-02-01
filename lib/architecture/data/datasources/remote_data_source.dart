import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../exception.dart';
import '../model/issue_response.dart';

abstract class RemoteDataSource {
  Future<IssueResponse> getCurrentIssues(int page);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<IssueResponse> getCurrentIssues(int page) async {

    var url = Urls.getCurrentIssues(1);

    final response = await client.get(Uri.parse(url));

    log("url $url");

    if (response.statusCode == 200) {

      log(response.body);

      return IssueResponse.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
