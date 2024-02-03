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
  Set<String> labelList = {};

  int pageNo = 1;
  bool isLastPage = false;

  @override
  void onInit() {
    _issueRepository = IssueRepository();
    super.onInit();
  }

  Future<void> getAllIssue({
    int pageSize = 20,
    bool isFromLoadNext = false,
    bool isLabeled = false
  }) async {
    if (!isFromLoadNext) {
      issueList = [];
      pageNo = 1;
    }

    loading();

    late String url;

    if(isLabeled){

      String labels = listToString(labelList);

      url = "${fetchListEndPoints}page=$pageNo&per_page=$pageSize&labels=$labels";

    }else{

      url = "${fetchListEndPoints}page=$pageNo&per_page=$pageSize";
    }



    _issueRepository.getIssueList(url, (response, error) {
      if (response != null) {

        var payload = response;

        for (var item in payload) {
          issueList.add(item);
        }

        if(response.isEmpty){

          isLastPage = true;

        }

        dismissLoading();
        update();
      } else {
        showMessage(error);
      }
    });
  }

  void loadNextPage() {
    if (!isLastPage) {
      pageNo++;
      getAllIssue(isFromLoadNext: true);
    }
  }

  void addLabelsToList(String input) {
    labelList.add(input);

    labelList.forEach((element) {
      log("label + $element");
    });

    getAllIssue(isLabeled: true);
  }

  void clearFilter(){

    labelList.clear();
    getAllIssue();
  }

}
