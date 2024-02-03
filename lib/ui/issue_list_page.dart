import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import '../base/base_state.dart';
import '../components/text_component.dart';
import '../controller/issue_controller.dart';
import '../utils/constants.dart';
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
      appBar: myAppBar(title: 'Issues', isNavigate: false, actions: [
        IconButton(
            onPressed: () => _issueController.clearFilter(),
            icon: const Icon(
              Icons.filter_alt_off,
              color: Colors.white,
            ))
      ]),
      body: GetBuilder<IssueController>(
        builder: (controller) {
          var posts = controller.issueList;

          if (posts.isNotEmpty) {
            return LazyLoadScrollView(
              isLoading: controller.isLastPage,
              onEndOfPage: () {
                controller.loadNextPage();
              },
              child: Padding(
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
                            color: kPrimaryLightColor,
                            elevation: 1,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextComponent(
                                    item.title,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: titleFontSize,
                                    textAlign: TextAlign.start,
                                    isTranslatable: false,
                                    padding: const EdgeInsets.only(left: 16.0),
                                  ),
                                  TextComponent(
                                    convertUtcToLocal(item.createdAt!),
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: textFontSize,
                                    textAlign: TextAlign.start,
                                    isTranslatable: false,
                                    padding: const EdgeInsets.only(left: 16.0),
                                  ),
                                  TextComponent(
                                    item.user?.login,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: textFontSize,
                                    textAlign: TextAlign.start,
                                    isTranslatable: false,
                                    padding: const EdgeInsets.only(left: 16.0),
                                  ),
                                  TextComponent(
                                    item.body,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: textSmallFontSize,
                                    textAlign: TextAlign.start,
                                    isTranslatable: false,
                                    padding: const EdgeInsets.only(
                                        left: 16.0, bottom: 8.0),
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                  ),
                                  item.labels != null && item.labels!.isNotEmpty
                                      ? SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            physics:
                                                const AlwaysScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemCount: item.labels?.length,
                                            itemBuilder: (context, index) {
                                              var label = item.labels?[index];

                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0, bottom: 8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.addLabelsToList(
                                                        label!.name!);
                                                  },
                                                  child: Chip(
                                                      label: TextComponent(
                                                    label?.name ?? "Not found",
                                                    padding: EdgeInsets.zero,
                                                  )),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : const SizedBox.shrink()
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            );
          } else {
            return noDataFoundWidget(divider: 1.25);
          }
        },
      ),
    );
  }
}
