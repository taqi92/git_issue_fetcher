import 'package:github_issue_fetcher/model/issue_response.dart';

import '../../utils/constants.dart';
import '../network/api_client.dart';

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
        callback(issuesFromJson(response.toString()), null);
      } else {
        callback(null, error);
      }
    });
  }
}
