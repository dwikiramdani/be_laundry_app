import 'package:be_laundry/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  static const routeName = "/";
  SplashView({super.key});

  SplashController controller = SplashController();

  @override
  Widget build(BuildContext context) {
    controller = context.read<SplashController>();
    controller.initContext(context);
    controller.initScreen();
    return const Scaffold(
      body: Center(
        child: Text("Welcome"),
      ),
    );
  }
}
