import 'package:be_laundry/view/order_summary_view.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  BuildContext? context;

  void initContext(BuildContext ctx) {
    context = ctx;
  }

  void navigateOrderSummary(){
    Navigator.pushNamed(context!, OrderSummaryView.routeName);
  }
}