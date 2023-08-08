import 'package:be_laundry/controller/order_summary_controller.dart';
import 'package:be_laundry/controller/splash_controller.dart';
import 'package:be_laundry/util/color.dart';
import 'package:be_laundry/util/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as cptn;
import 'package:provider/provider.dart';

class OrderSummaryView extends StatelessWidget {
  static const routeName = "order-summary-view";
  OrderSummaryView({super.key});

  OrderSummaryController controller = OrderSummaryController();

  final lColor = LColor();
  final lStyle = LTextStyle();

  Widget buildCustomAppBar(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: lColor.vividCerulean,
              size: 24,
            ),
          ),
        ),
        Center(
          child: Text(
            "Order Summary",
            style: TextStyle(
              fontSize: 21.43,
              fontWeight: FontWeight.w500,
              color: lColor.vividCerulean,
            ),
          ),
        ),
      ],
    );
  }

  Widget orderAddressComponent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Outlet Location",
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto"),
              ),
              SizedBox(height: 4),
              Text(
                "Sahid sudirman",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                ),
              ),
            ],
          ),
          Container(
            width: 110,
            alignment: Alignment.centerRight,
            child: const Text(
              "123 Pasir Ris, 13810, Singapore",
              style: TextStyle(
                fontSize: 13.04,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget orderPaperCut() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: lColor.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: lColor.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Widget individualOrderTile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          Container(
            width: 60.81,
            height: 55,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              image: DecorationImage(
                image: NetworkImage(
                  "https://placehold.co/60x55/png",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Bag of Laundry",
                  style: TextStyle(
                    fontSize: 14.91,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Roboto",
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Qty: 2",
                  style: TextStyle(
                    fontSize: 11.56,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                    color: lColor.vividCerulean,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 9.47,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "\$ 180.00",
                style: TextStyle(
                  fontSize: 14.1,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Roboto",
                  color: lColor.vividCerulean,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildOrderList() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 12),
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: lColor.celestialBlue,
          height: 24,
          thickness: 1,
        ),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) => individualOrderTile(),
      ),
    );
  }

  Widget buildOrderCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: lColor.vividCerulean,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              "ORDER #21340",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Roboto",
                color: lColor.white,
              ),
            ),
          ),
          Container(
            color: lColor.cultured,
            child: Column(
              children: [
                orderAddressComponent(),
                orderPaperCut(),
                buildOrderList(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "TOTAL ORDER",
                  style: TextStyle(
                    fontSize: 15.51,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
                    color: lColor.white,
                  ),
                ),
                Text(
                  "\$ 204.00",
                  style: TextStyle(
                    fontSize: 18.51,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Roboto",
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

  Widget buildWhatsAppButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 64,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: lColor.mediumAquamarine,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/images/chat_alt.png"),
            fit: BoxFit.cover,
            width: 46,
            height: 46,
          ),
          Text(
            "WHATSAPP US",
            style: TextStyle(
              fontSize: 15.51,
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto",
              color: lColor.white,
            ),
          )
        ],
      ),
    );
  }

  Widget buildDownloadButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      height: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 2, color: lColor.vividCerulean),
      ),
      child: Text(
        "Download Invoice",
        style: TextStyle(
          fontSize: 15.51,
          fontWeight: FontWeight.w700,
          fontFamily: "Roboto",
          color: lColor.vividCerulean,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    controller = context.read<OrderSummaryController>();
    controller.initContext(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCustomAppBar(context),
              const SizedBox(height: 32),
              buildOrderCard(),
              const SizedBox(height: 24),
              buildWhatsAppButton(),
              const SizedBox(height: 24),
              buildDownloadButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
