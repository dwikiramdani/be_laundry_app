import 'package:be_laundry/controller/home_controller.dart';
import 'package:be_laundry/controller/login_controller.dart';
import 'package:be_laundry/controller/order_summary_controller.dart';
import 'package:be_laundry/controller/splash_controller.dart';
import 'package:be_laundry/view/home_view.dart';
import 'package:be_laundry/view/login_view.dart';
import 'package:be_laundry/view/order_summary_view.dart';
import 'package:be_laundry/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SplashController()),
        ChangeNotifierProvider(create: (_) => OrderSummaryController()),
      ],
      child: MaterialApp(
        title: 'Be Laundry',
        theme: ThemeData(fontFamily: "Poppins"),
        routes: <String, WidgetBuilder>{
          SplashView.routeName: (context) => SplashView(),
          LoginView.routeName: (context) => LoginView(),
          HomeView.routeName: (context) => HomeView(),
          OrderSummaryView.routeName: (context) => OrderSummaryView(),
        },
        initialRoute: SplashView.routeName,
      ),
    );
  }
}
