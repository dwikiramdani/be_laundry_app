import 'package:be_laundry/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  BuildContext? context;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  bool isPasswordObscure = true;

  void initContext(BuildContext ctx) {
    context = ctx;
  }

  void initControllerNode(
    TextEditingController? emailCtrl,
    TextEditingController? passwordCtrl,
    FocusNode? emailFN,
    FocusNode? passwordFN,
  ) {
    emailController = emailCtrl!;
    passwordController = passwordCtrl!;
    emailFocusNode = emailFN!;
    passwordFocusNode = passwordFN!;
  }

  void navigateHome() {
    Navigator.pushNamedAndRemoveUntil(
      context!,
      HomeView.routeName,
      (route) => false,
    );
  }

  @override
  void dispose() {
    emailController;
    passwordController;
    emailFocusNode;
    passwordFocusNode;
    super.dispose();
  }
}
