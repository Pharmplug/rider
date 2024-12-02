import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/components/input_field.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_delivered.dart';
import 'package:pharmplug_rider/views/order/order.dart';
import 'package:pharmplug_rider/views/order/order_tracker.dart';
import '../../../constants/resources.dart';
import 'package:dotted_line/dotted_line.dart';

class OrderDetailsScreen extends StatefulWidget {
  final List<OrderItem> items;

  const OrderDetailsScreen({Key? key, required this.items})
      : super(
          key: key,
        );

  @override
  _OrderState createState() => _OrderState();
}

class OrderItem {
  final String name;
  final String quantity;

  OrderItem({required this.name, required this.quantity});
}

class _OrderState extends State<OrderDetailsScreen> {
  late int index = 0;
  bool showTracker = false;
  final random = Random();
  int currentStep = 0;
  bool statusContainer = false;
  bool showEarnings = false;

  final List<String> buttonTexts = [
    "Accept This Order",
    "Proceed to Pickup",
    "At the Store",
    "Ready To Be On Transit",
    "Proceed For Delivery",
    "Confirm Delivery"
  ];

  final List<String> trackerTexts = [
    "To Pickup",
    "At the Store",
    "On Transit",
    "Drop Off"
  ];
  final List<Map<String, dynamic>> statuses = [
    {
      "text": "Accepted",
      "textColor": Pallete.hintText,
      "containerColor": Color(0XFFF2F4F7),
      "borderColor": Pallete.hintText,
      "iconColor": Pallete.hintText
    },
    {
      "text": "To Pickup",
      "textColor": Pallete.hintText,
      "containerColor": Color(0XFFF2F4F7),
      "borderColor": Pallete.hintText,
      "iconColor": Pallete.hintText
    },
    {
      "text": "At the Store",
      "textColor": Color(0XFFC4320A),
      "containerColor": Color(0XFFF6ED),
      "borderColor": Color(0XFFC4320A),
      "iconColor": Color(0XFFC4320A)
    },
    {
      "text": "On Transit",
      "textColor": Color(0XFF026AA2),
      "containerColor": Color(0XFFECEEFC),
      "borderColor": Color(0XFF026AA2),
      "iconColor": Color(0XFF026AA2)
    },
    {
      "text": "At Drop Off",
      "textColor": Color(0XFF026AA2),
      "containerColor": Color(0XFFE2E2F8),
      "borderColor": Color(0XFF026AA2),
      "iconColor": Color(0XFF026AA2)
    },
    {
      "text": "Delivered",
      "textColor": Color(0XFF027A48),
      "containerColor": Color(0XFFECFDF3),
      "borderColor": Color(0XFF027A48),
      "iconColor": Color(0XFF027A48)
    },
  ];
  // final List<Color> containerColors = [
  //   Color(0xFFD9D9D9), // Default
  //   Pallete.primaryColor, // Active step
  // ];

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    },
                    child: Image.asset(
                      AppImages.back,
                      scale: 2,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: Text('Order Details',
                        style: AppFonts.text16Barlow
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  currentStep >= 1
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: statuses[currentStep]["borderColor"],
                                  width: 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                              color: statuses[currentStep]["containerColor"]),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.moped,
                                scale: 5,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: _getSize.width * 0.013,
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                statuses[currentStep - 1]["text"],
                                style: AppFonts.text12Barlow.copyWith(
                                    color: statuses[currentStep]["textColor"],
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        )
                      : SizedBox.shrink()
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(8),
                // height: _getSize.height * 0.19,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TrackerIcons(
                                getSize: _getSize,
                                icon: Image.asset(
                                  AppImages.store,
                                  color: Pallete.whiteColor,
                                ),
                                containerColor: Pallete.primaryColor,
                              ),
                              SizedBox(
                                width: _getSize.width * 0.02,
                              ),
                              Text(
                                trackers[index].name,
                                style: AppFonts.text12Barlow
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Pallete.secondaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: _getSize.width * 0.01,
                              ),
                              Text(
                                trackers[index].time,
                                style: AppFonts.text12Barlow,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _getSize.height * 0.02,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: _getSize.width * 0.02,
                              ),
                              Container(
                                width: _getSize.width * 0.031,
                                height: _getSize.height * 0.015,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Pallete.primaryColor
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(1, 0),
                                      ),
                                    ],
                                    color: Pallete.primaryColor),
                              ),
                              SizedBox(
                                width: _getSize.width * 0.035,
                              ),
                              Text(
                                trackers[index].addressFrom,
                                style: AppFonts.text12Barlow,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 8),
                            child: DottedLine(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.center,
                              lineLength: _getSize.height * 0.03,
                              lineThickness: 1.5,
                              dashLength: 6.0,
                              dashColor: Pallete.primaryColor,
                              dashRadius: 0.0,
                              dashGapLength: 3.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: _getSize.width * 0.02,
                              ),
                              Container(
                                width: _getSize.width * 0.031,
                                height: _getSize.height * 0.015,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Pallete.primaryColor
                                            .withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 7,
                                        offset: Offset(1, 0),
                                      ),
                                    ],
                                    color: Pallete.whiteColor),
                              ),
                              SizedBox(
                                width: _getSize.width * 0.035,
                              ),
                              Text(
                                trackers[index].addressTo,
                                style: AppFonts.text12Barlow,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.025,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.box,
                    scale: 2,
                  ),
                  SizedBox(
                    width: _getSize.width * 0.03,
                  ),
                  Text('item Details',
                      style: AppFonts.text16Barlow
                          .copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.012,
              ),
              Container(
                //  height: _getSize.height * 0.4,
                child: ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Container(
                              width: _getSize.width * 0.02,
                              height: _getSize.height * 0.013,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Pallete.secondaryColor),
                            ),
                          ),
                          SizedBox(
                            width: _getSize.width * 0.035,
                          ),
                          Expanded(
                              child: Text(item.name,
                                  style: AppFonts.text14Barlow)),
                          Text(item.quantity, style: AppFonts.text14Barlow)
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.02,
              ),
              Row(
                children: [
                  Image.asset(
                    AppImages.moped,
                    scale: 3,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: _getSize.width * 0.015,
                  ),
                  Expanded(
                    child: Text('Estimated Distance',
                        style: AppFonts.text14Barlow
                            .copyWith(fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(trackers[index].distance,
                        style: AppFonts.text14Barlow
                            .copyWith(fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.03,
              ),
              if (showTracker)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFCDEFF5)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(trackerTexts.length, (index) {
                      bool isActive = currentStep > index;
                      return Row(
                        children: [
                          TrackerIcons(
                            getSize: _getSize,
                            icon: index == trackerTexts.length - 1
                                ? Icon(Icons.location_on_outlined,
                                    color: Colors.white) // Last step icon
                                : index == 1
                                    ? Image.asset(
                                        // "At the Store" image
                                        AppImages.store,
                                        scale: 3,
                                        color: Colors.white,
                                      )
                                    : Image.asset(
                                        // Default "Moped" image
                                        AppImages.moped,
                                        scale: 3,
                                        color: Colors.white,
                                      ),
                            containerColor: currentStep > index + 1
                                ? Colors.blue
                                : Color(0xFFD9D9D9),
                            text: Text(
                              trackerTexts[index],
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ),
                          if (index < trackerTexts.length - 1)
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: _getSize.height * 0.04,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: isActive
                                  ? Pallete.primaryColor
                                  : Color(0xFFD9D9D9),
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              Text('Note',
                  style: AppFonts.text14Barlow
                      .copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: _getSize.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Pallete.secondaryColor),
                ),
                child: Text(
                    'Please be careful the items as they are fragile and do not shake so much.\nHand over the items to security when you reach the destination.',
                    style: AppFonts.text14Barlow
                        .copyWith(color: Pallete.hintText)),
              ),
              SizedBox(
                height: _getSize.height * 0.18,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentStep == 0) {
                      showTracker = true; // Enable tracker visibility
                    }
                    if (currentStep < buttonTexts.length - 1) {
                      currentStep++;
                    }

                    // Check if it's the last step after updating currentStep
                    if (currentStep == buttonTexts.length - 1) {
                      // Show dialog
                      showDialog(
                        context: context,
                        barrierDismissible:
                            true, // Allows dismissing the dialog by tapping outside
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              contentPadding: const EdgeInsets.all(20),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: Text(
                                      'Confirm this code with the recipient',
                                      style: AppFonts.text16Barlow.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  Image.asset(
                                    AppImages.requestedAccess,
                                    scale: 1,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(4, (index) {
                                      int randomNumber = random.nextInt(9);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Container(
                                          width: 44,
                                          height: 44,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.lightBlue
                                                    .withOpacity(0.1),
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                            border: const Border(
                                              bottom: BorderSide(
                                                color: Colors.lightBlue,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            '$randomNumber',
                                            style:
                                                AppFonts.text18Inter.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: Pallete.black,
                                              fontSize: 24,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                  ),
                                  ButtonWithFunction(
                                    text: "Confirm Code",
                                    onPressed: () {
                                      setState(() {
                                        showEarnings = true;
                                        showTracker = false;
                                      });
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              OrderDetailsScreen(items: []),
                                        ),
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          AppImages.iconBack,
                                          scale: 2,
                                          color: Pallete.secondaryColor,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10.0),
                                          child: Text(
                                            'Go Back',
                                            style:
                                                AppFonts.text12Barlow.copyWith(
                                              color: Pallete.secondaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  });
                },
                child: Column(
                  children: [
                    if (showEarnings)
                      SizedBox(
                        // width: _getSize.width * 0.78,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0XFFECFDF3),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    AppImages.wallet2,
                                    scale: 1,
                                    width: _getSize.width * 0.07,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Earning',
                                      style: AppFonts.text14Barlow.copyWith(
                                        color: Color(0XFF027A48),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Text(
                                      '₦10,000,00',
                                      style: AppFonts.text14Barlow.copyWith(
                                        color: Color(0XFF027A48),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        width: _getSize.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              buttonTexts[currentStep],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            if (currentStep < buttonTexts.length - 1)
                              SizedBox(width: 10),
                            if (currentStep > 0 &&
                                currentStep < buttonTexts.length - 1)
                              Image.asset(
                                AppImages.caretDoubleRight,
                                scale: 1,
                              )
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.02,
              ),
              currentStep > index
                  ? SizedBox.shrink()
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderScreen(), 
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 16),
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Pallete.textRed, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Reject',
                          style: AppFonts.text14Barlow.copyWith(
                              color: Pallete.textRed,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      )),
    );
  }
}

class TrackerIcons extends StatelessWidget {
  const TrackerIcons(
      {super.key,
      required Size getSize,
      required this.icon,
      required this.containerColor,
      this.text})
      : _getSize = getSize;

  final Size _getSize;
  final Widget icon;
  final Widget? text;
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipOval(
          child: Container(
            width: _getSize.width * 0.075,
            color: containerColor,
            child: Padding(padding: const EdgeInsets.all(5.0), child: icon),
          ),
        ),
        text ?? const SizedBox()
      ],
    );
  }
}
