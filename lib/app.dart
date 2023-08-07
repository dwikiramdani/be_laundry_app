import 'package:be_laundry/view/home_view.dart';
import 'package:be_laundry/view/model/home_model.dart';
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
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const HomeView(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
