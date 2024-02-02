import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:github_issue_fetcher/model/issue_response.dart';
import '../repositories/issue_repository.dart';
import '../utils/constants.dart';
import '../utils/endpoints.dart';

abstract class IssueRepositoryInterface {
  void getIssue();
}

class IssueController extends GetxController {
  late final IssueRepository _issueRepository;

  List<IssueResponse> issueList = [];

  // Track the loading and loaded states
  bool isLoading = false;
  bool isLoaded = false;
  int pageNo = 0;

  @override
  void onInit() {
    _issueRepository = IssueRepository();
    super.onInit();
  }

  Future<void> getAllIssue({
    int pageSize = 20,
    bool isFromLoadNext = false,
  }) async {
    if (!isFromLoadNext) {
      issueList = [];
      pageNo = 1;
    }

    String url = "https://api.github.com/repos${fetchListEndPoints}page=$pageNo&per_page=$pageSize";

    /*_issueRepository.getIssueList(url, (response, error) {
      if (response != null) {

        issueList = [];

        var payload = response;

        for (var item in payload) {
          issueList.add(item);
        }

        //isLastPage = payload?.last == true;

        dismissLoading();
        update();
      } else {
        showMessage(error);
      }
    });*/

    final dio = Dio();

    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final responseData = response.data;

      if (responseData is List<dynamic>) {
        final data = (response.data as List<dynamic>);
        final List<IssueResponse> photos =
        data.map((e) => IssueResponse.fromJson(e)).toList();

        for (var element in photos) {
          issueList.add(element);
          update();
        }
      }

      pageNo++;

      //isLastPage = payload?.last == true;

    } else {
    }
  }
}
