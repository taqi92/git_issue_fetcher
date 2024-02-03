import 'dart:developer';

import 'package:github_issue_fetcher/model/issue_response.dart';

import '../../utils/constants.dart';
import '../network/api_client.dart';
import '../utils/helper.dart';

class IssueRepository {
  final ApiClient _apiClient = ApiClient.apiClient;
  static final IssueRepository _issueRepository = IssueRepository._internal();

  IssueRepository._internal();

  factory IssueRepository() {
    return _issueRepository;
  }

  void getIssueList(
      String url, ResponseCallback<List<IssueResponse>?, String?> callback) {
    _apiClient.getRequest(url, (response, error) {
      if (response != null) {

        List<IssueResponse> issues = getItemsFromJson(response, (x) => IssueResponse.fromJson(x));

        callback(issues, null);

      } else {
        callback(null, error);
      }
    });
  }
}
