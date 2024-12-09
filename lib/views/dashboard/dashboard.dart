import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/models/recent_deliveries.dart';
import 'package:pharmplug_rider/network/rider.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:pharmplug_rider/views/dashboard/dashboard_deliveries.dart';
import 'package:pharmplug_rider/views/dashboard/dashboard_tracker.dart';
import 'package:provider/provider.dart';
import '../../constants/resources.dart';
import 'dashboard_header.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool amountVisible = false;
  var amount = "******";
   bool isSwitched=false;
   bool hasNotifications = true;
  var deliveries = "0";
  var orderId = "FI56H17";
  var addressFrom = "11, Mike Adenuga, Ikate, Lekki, Lagos.";
  var addressTo = "20, Ligali Ayorinde, Ikoyi, Lagos.";
  var balance = "";
  var time = "10:12AM";
  String name = "";

  void toggleAmountVisibility() {
    setState(() {
      amountVisible = !amountVisible;
      amount = amountVisible ? (balance.isNotEmpty ? balance : "0.00") : "******";
    });
  }

  toggleSwitch(bool value) async {
    var res = await RiderAPI.updateWork(value);
    if (res["statusCode"] == 200) {
      await saveIsWorking(res['data']['rider']['isWorking']);
      setState(() {
        isSwitched = res['data']['rider']['isWorking'];
      });
    } else {
      isSwitched;
    }
  }

  getUserData() async {
    name = await showName();
    balance = await showBalance();
    isSwitched = await showIsWorking();
    deliveries = deliveries.isNotEmpty ? deliveries : "0";
    setState(() {
      name;
      balance;
      isSwitched;
      deliveries;
    });
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Pallete.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DashboardHeader(
                name: name,
                amountVisible: amountVisible,
                amount: amount,
                isSwitched: isSwitched,
                toggleAmountVisibility: toggleAmountVisibility,
                toggleSwitch: toggleSwitch,
                hasNotifications: hasNotifications,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [
                    SizedBox(
                      height: _getSize.height * 0.025,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(AppImages.bg),
                          fit: BoxFit
                              .cover, // This ensures the image covers the container
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Pallete.backgroundColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    AppImages.package,
                                    width: _getSize.width * 0.2,
                                  ),
                                )),
                            SizedBox(
                              width: _getSize.width * 0.025,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "$deliveries deliveries in your region",
                                  style: AppFonts.text16Barlow
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "view orders",
                                      style: AppFonts.text14Barlow.copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xFF035968)),
                                    ),
                                    SizedBox(
                                      height: _getSize.height * 0.05,
                                    ),
                                    Icon(
                                      Icons.chevron_right_outlined,
                                      weight: 0.01,
                                      color: Pallete.hintText,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DashboardTracker(
                  time: time,
                  tracking: 0,
                  orderId: orderId,
                  isOnTransit: isSwitched,
                  addressFrom: addressFrom,
                  addressTo: addressTo),
              DashboardDeliveries(
                orders: orders,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
