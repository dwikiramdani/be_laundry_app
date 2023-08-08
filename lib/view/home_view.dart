import 'package:be_laundry/controller/home_controller.dart';
import 'package:be_laundry/util/color.dart';
import 'package:be_laundry/util/textstyle.dart';
import 'package:be_laundry/view/order_summary_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home-view';

  HomeView({super.key});

  HomeController controller = HomeController();

  final lColor = LColor();
  final lStyle = LTextStyle();

  Widget buildHomeTitle() {
    return Container(
      padding: const EdgeInsets.only(top: 64),
      alignment: Alignment.center,
      child: Text(
        "Be Laundry",
        style: TextStyle(
          fontSize: 21.43,
          fontWeight: FontWeight.w500,
          color: lColor.white,
        ),
      ),
    );
  }

  Widget buildUserStatusCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: lColor.cultured,
      ),
      child: Row(
        children: [
          Container(
            width: 46.65,
            height: 50.82,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/400x400/png",
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Good Morning",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: lColor.vividCerulean,
                borderRadius: const BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Your balance",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: lColor.white,
                    ),
                  ),
                  Text(
                    "\$ 14,000.00",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: lColor.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget serviceListTile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: lColor.cultured,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/400x400/png",
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            "Wash & Fold",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildServiceList() {
    List<Widget> widgets = [];
    for (int i = 0; i <= 10; i++) {
      if (i == 0) {
        widgets.add(const SizedBox(width: 8));
      }
      widgets.add(serviceListTile());
      if (i == 10) {
        widgets.add(const SizedBox(width: 8));
      }
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: widgets),
    );
  }

  Widget buildLatestOrder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Latest Order",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: lColor.celestialBlue,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(left: 12),
            height: 95,
            decoration: BoxDecoration(
              color: lColor.cultured,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 79,
                  height: 79,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://placehold.co/400x400/png",
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            "Order ID: 21340",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const Text(
                          "Total Order",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          "\$ 180.00",
                          style: TextStyle(
                            fontSize: 14.85,
                            fontWeight: FontWeight.w700,
                            color: lColor.vividCerulean,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.navigateOrderSummary();
                  },
                  child: Container(
                    height: 95,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: lColor.vividCerulean,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: const Alignment(0.8, 1),
                        colors: <Color>[
                          lColor.vividCerulean.withOpacity(1),
                          lColor.vividCerulean.withOpacity(.42),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/note.png"),
                          fit: BoxFit.cover,
                          width: 46,
                          height: 46,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "INVOICE",
                          style: TextStyle(
                            fontSize: 10.45,
                            fontWeight: FontWeight.w500,
                            color: lColor.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildMostOrdered() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your most ordered product",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: lColor.celestialBlue,
            ),
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 214,
                padding: const EdgeInsets.only(left: 24, bottom: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://placehold.co/335x214/png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 214,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment(0.0, .01),
                    colors: <Color>[
                      lColor.vividCerulean.withOpacity(.4),
                      lColor.vividCerulean.withOpacity(.0),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 214,
                padding: const EdgeInsets.only(left: 24, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Dry Cleaning",
                      style: TextStyle(
                        fontSize: 23.69,
                        fontWeight: FontWeight.w700,
                        color: lColor.white,
                      ),
                    ),
                    Text(
                      "12x | total of \$ 4.000",
                      style: TextStyle(
                        fontSize: 16.96,
                        fontWeight: FontWeight.w500,
                        color: lColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget latestProductTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          Container(
            width: 176,
            height: 214,
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/176x214/png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 176,
            height: 214,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment(0.0, .01),
                colors: <Color>[
                  lColor.vividCerulean.withOpacity(.4),
                  lColor.vividCerulean.withOpacity(.0),
                ],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Container(
            width: 176,
            height: 214,
            padding: const EdgeInsets.only(left: 12, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Dry Cleaning",
                  style: TextStyle(
                    fontSize: 9.31,
                    fontWeight: FontWeight.w400,
                    color: lColor.white,
                  ),
                ),
                Text(
                  "Jeans",
                  style: TextStyle(
                    fontSize: 23.69,
                    fontWeight: FontWeight.w700,
                    color: lColor.white,
                  ),
                ),
                Text(
                  "\$ 10.00/pc",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: lColor.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLatestProduct() {
    List<Widget> widgets = [];
    for (int i = 0; i <= 10; i++) {
      if (i == 0) {
        widgets.add(const SizedBox(width: 8));
      }
      widgets.add(latestProductTile());
      if (i == 10) {
        widgets.add(const SizedBox(width: 8));
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "Your most ordered product",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: lColor.celestialBlue,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: widgets),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    controller = context.read<HomeController>();
    controller.initContext(context);
    return Scaffold(
      backgroundColor: lColor.pastelRed,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHomeTitle(),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: lColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  buildUserStatusCard(),
                  buildServiceList(),
                  const SizedBox(height: 40),
                  buildLatestOrder(context),
                  buildMostOrdered(),
                  const SizedBox(height: 40),
                  buildLatestProduct(),
                  const SizedBox(height: 64),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
