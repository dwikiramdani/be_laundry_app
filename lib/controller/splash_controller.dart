import 'package:be_laundry/view/login_view.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  BuildContext? context;

  void initContext(BuildContext ctx) {
    context = ctx;
  }

  Future<void> initScreen() async {
    await Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context!,
        LoginView.routeName,
        (route) => false,
      );
    });
  }
}
