import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/components/input_field.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_OnTransit.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_delivered.dart';
import 'package:pharmplug_rider/views/order/order_tracker.dart';
import '../../../constants/resources.dart';
import 'package:dotted_line/dotted_line.dart';
import 'dart:ui';

class OrdersAtDropOff extends StatefulWidget {
  final List<OrderItem> item;

  const OrdersAtDropOff({
    Key? key,
    required this.item,
  }) : super(
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

class _OrderState extends State<OrdersAtDropOff> {
  final int tracking = 2;
  final random = Random();
  late int index = 0;

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
                      builder: (context) => OrdersOnTransit(item: []), // Pass your item here
                    ),
                  );
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
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFF026AA2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.gps,
                          scale: 5,
                          color: Color(0XFF026AA2),
                        ),
                        SizedBox(
                          width: _getSize.width * 0.013,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'At Drop-off',
                          style: AppFonts.text12Barlow.copyWith(
                              color: Color(0XFF026AA2),
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
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
                height: _getSize.height * 0.04,
              ),
               Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFCDEFF5)),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TrackerIcons(
                              getSize: _getSize,
                              icon: Image.asset(AppImages.moped),
                              containerColor: Pallete.primaryColor,
                              text: Text(
                                "To Pickup",
                                style: AppFonts.text12Barlow,
                              ),
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              lineLength: _getSize.height * 0.04,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: 
                                  Pallete.primaryColor,
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            TrackerIcons(
                              text: Text(
                                "At the store",
                                style: AppFonts.text12Barlow,
                              ),
                              getSize: _getSize,
                              icon: Image.asset(
                                AppImages.store,
                              ),
                              containerColor:
                                     Pallete.primaryColor
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: _getSize.height * 0.04,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: 
                                   Pallete.primaryColor,
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            TrackerIcons(
                              text: Text(
                                "On Transit",
                                style: AppFonts.text12Barlow,
                              ),
                              getSize: _getSize,
                              icon: Image.asset(
                                AppImages.moped,
                            ),
                              containerColor:
                                    Pallete.primaryColor
                            ),
                            DottedLine(
                              direction: Axis.horizontal,
                              alignment: WrapAlignment.center,
                              lineLength: _getSize.height * 0.04,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor:
                                   Pallete.primaryColor,
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            TrackerIcons(
                              text: Text(
                                "Drop Off",
                                style: AppFonts.text12Barlow,
                              ),
                              getSize: _getSize,
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: Pallete.disabledColor,
                              ),
                              containerColor: Color(0xFFD9D9D9),
                            ),
                            SizedBox(
                              width: _getSize.width * 0.04,
                            ),
                          ],
                        ),
                      ),
              SizedBox(
                height: _getSize.height * 0.03,
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
                height: _getSize.height * 0.08,
              ),
              GestureDetector(
                onTap: () {
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
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Text(
                                  'Confirm this code with the recipient',
                                  style: AppFonts.text16Barlow.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Image.asset(
                                AppImages.requestedAccess,
                                scale: 1,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                                        borderRadius: BorderRadius.circular(10),
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
                                        style: AppFonts.text18Inter.copyWith(
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
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              ButtonWithFunction(
                                text: "Confirm Code",
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OrderDelivered(items: []),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OrdersAtDropOff(item: []),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        style: AppFonts.text12Barlow.copyWith(
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
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Pallete.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm Delivery',
                        style: AppFonts.text16Barlow.copyWith(
                            color: Pallete.whiteColor,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: _getSize.width * 0.04,
                      ),
                      Image.asset(
                        AppImages.caretDoubleRight,
                        scale: 1,
                      ),
                    ],
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
