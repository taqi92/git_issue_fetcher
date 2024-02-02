import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../base/base_state.dart';
import '../components/text_component.dart';
import '../controller/issue_controller.dart';
import '../utils/size_config.dart';
import '../utils/style.dart';

class IssueListPage extends StatefulWidget {
  const IssueListPage({super.key});

  @override
  State<IssueListPage> createState() => _IssueListState();
}

class _IssueListState extends BaseState<IssueListPage> {

  final _issueController = Get.put(IssueController());

  @override
  void initState() {

    _issueController.getAllIssue();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(
        title: 'Posts',
      ),
      body: GetBuilder<IssueController>(
        builder: (controller) {

          var posts = controller.issueList;

          if (posts.isNotEmpty) {
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {

                    var item = posts[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, bottom: 8.0, top: 8.0),
                      child: SizedBox(
                        width: SizeConfig.getScreenWidth(context) / 1.5,
                        child: Card(
                          color: Colors.transparent,
                          elevation: 1,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: TextComponent(
                            item.title,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            isTranslatable: false,
                          ),
                        ),
                      ),
                    );
                  },
                )
            );
          } else {
            return noDataFoundWidget(divider: 1.25);
          }
        },
      ),
    );
  }
}
