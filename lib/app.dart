import 'package:be_laundry/controller/home_model.dart';
import 'package:be_laundry/view/home_view.dart';
import 'package:be_laundry/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        HomeModel();
      },
      child: MaterialApp(
        title: 'Be Laundry',
        theme: ThemeData(fontFamily: "Poppins"),
        home: LoginView(),
      ),
    );
  }
}
