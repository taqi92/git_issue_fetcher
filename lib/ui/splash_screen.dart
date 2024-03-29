import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_issue_fetcher/utils/style.dart';

import '../../base/base_state.dart';
import '../../gen/assets.gen.dart';
import '../../utils/constants.dart';
import 'package:get/get.dart';

import 'issue_list_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isInternetConnected(context).then((internet) {
      if (internet) {
        // Internet Present Case

        proceed();
      } else {
        // No-Internet Case
        showWarningDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPreliminaryColor,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.ogImage.path,
                fit: BoxFit.fitHeight,
              ),
              Image.asset(Assets.images.splashLoader.path),
            ],
          ),
        ));
  }

  /*showWarningDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: const Text(
        "Retry",
      ),
      onPressed: () {
        Navigator.pop(context);

        isInternetConnected(context).then((internet) {
          if (internet) {
            // Internet Present Case
            //startTime();
          } else {
            // No-Internet Case
            showWarningDialog(context);
          }
        });
      },
    );

    Widget cancelButton = TextButton(
      child: const Text(
        "Exit",
      ),
      onPressed: () {
        if (Platform.isAndroid) {
          SystemNavigator.pop();
        } else if (Platform.isIOS) {
          exit(0);
        }
      },
    );

    if (Platform.isIOS) {
      CupertinoAlertDialog alert = CupertinoAlertDialog(
        title: const Text(
          "No Internet connection!",
        ),
        content: const Text(
          "Please Connect your device to internet first",
        ),
        actions: [cancelButton, continueButton],
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    } else {
      AlertDialog alert = AlertDialog(
        elevation: 2,
        title: const Text(
          "No Internet connection!",
        ),
        content: const Text(
          "Please Connect your device to internet first",
        ),
        actions: [cancelButton, continueButton],
      );
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
  }*/

  showWarningDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: const Text("Retry"),
      onPressed: () {
        Navigator.pop(context);
        isInternetConnected(context).then((internet) {
          internet ? proceed() : showWarningDialog(context);
        });
      },
    );

    Widget cancelButton = TextButton(
      child: const Text("Exit"),
      onPressed: () => Platform.isAndroid ? SystemNavigator.pop() : exit(0),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text("No Internet connection!"),
                content:
                    const Text("Please connect your device to the internet."),
                actions: [cancelButton, continueButton],
              )
            : AlertDialog(
                elevation: 2,
                title: const Text("No Internet connection!"),
                content:
                    const Text("Please connect your device to the internet."),
                actions: [cancelButton, continueButton],
              );
      },
    );
  }

  void proceed() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const IssueListPage(), transition: sendTransition);
    });
  }
}
