import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pharmplug_rider/constants/resources.dart';


class DashboardTracker extends StatefulWidget {
  final bool isOnTransit;
  final String orderId;
  final String addressFrom;
  final String addressTo;
  final String time;
  final int tracking;
  const DashboardTracker(
      {Key? key,
      required this.orderId,
      required this.tracking,
      required this.isOnTransit,
      required this.addressFrom,
      required this.addressTo,
      required this.time})
      : super(key: key);

  @override
  State<DashboardTracker> createState() => _DashboardTrackerState();
}

class _DashboardTrackerState extends State<DashboardTracker> {
  bool hasOrders = orders.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
          height: _getSize.height * 0.345,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Order",
                        style: AppFonts.text16Barlow,
                      ),
                      Row(
                        children: [
                          Text(
                            "ID:  ",
                            style: AppFonts.text14Barlow
                                .copyWith(color: Pallete.hintText),
                          ),
                          Text(
                            widget.orderId,
                            style: AppFonts.text14Barlow,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: _getSize.width * 0.21,
                        decoration: BoxDecoration(
                          color: widget.isOnTransit
                              ? Color(0xFF175CD3).withOpacity(0.1)
                              : Pallete.textRed.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 12,
                                color: widget.isOnTransit
                                    ? Color(0xFF175CD3)
                                    : Pallete.textRed,
                              ),
                              Text(
                                "On Transit",
                                style: AppFonts.text12Barlow.copyWith(
                                  color: widget.isOnTransit
                                      ? Color(0xFF175CD3)
                                      : Pallete.textRed,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: _getSize.height * 0.005),
                      Text(
                        "View Details",
                        style: AppFonts.text14Barlow.copyWith(
                            color: Pallete.secondaryColor,
                            fontWeight: FontWeight.w300,
                            decoration: TextDecoration.underline,
                            decorationColor: Pallete.secondaryColor),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.025,
              ),
              hasOrders ?
              Container(
                height: _getSize.height * 0.27,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 241, 241, 241),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                                "Julie Harrison Pharmacy Store",
                                style: AppFonts.text14Barlow,
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
                              Text(
                                widget.time,
                                style: AppFonts.text14Barlow,
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
                                widget.addressFrom,
                                style: AppFonts.text14Barlow,
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 8),
                            child: DottedLine(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.center,
                              lineLength: _getSize.height * 0.04,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Pallete.primaryColor,
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
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
                                widget.addressTo,
                                style: AppFonts.text14Barlow,
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _getSize.height * 0.025,
                      ),
                      Row(
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
                            dashColor: widget.tracking >= 0
                                ? Pallete.primaryColor
                                : Pallete.disabledColor,
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
                              color: widget.tracking >= 1
                                  ? Pallete.whiteColor
                                  : Pallete.disabledColor,
                            ),
                            containerColor: widget.tracking >= 1
                                ? Pallete.primaryColor
                                : Color(0xFFD9D9D9),
                          ),
                          DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: _getSize.height * 0.04,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: widget.tracking >= 1
                                ? Pallete.primaryColor
                                : Pallete.disabledColor,
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
                              color: widget.tracking >= 2
                                  ? Pallete.whiteColor
                                  : Pallete.disabledColor,
                            ),
                            containerColor: widget.tracking >= 2
                                ? Pallete.primaryColor
                                : Color(0xFFD9D9D9),
                          ),
                          DottedLine(
                            direction: Axis.horizontal,
                            alignment: WrapAlignment.center,
                            lineLength: _getSize.height * 0.04,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: widget.tracking >= 2
                                ? Pallete.primaryColor
                                : Pallete.disabledColor,
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
                              color: widget.tracking >= 3
                                  ? Pallete.whiteColor
                                  : Pallete.hintText,
                            ),
                            containerColor: widget.tracking >= 3
                                ? Pallete.primaryColor
                                : Color(0xFFD9D9D9),
                          ),
                          SizedBox(
                            width: _getSize.width * 0.04,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ) : Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                        AppImages.imageBox,
                        scale: 1,
                      ),
                      SizedBox(height: _getSize.height * 0.02),
                    Text("No Current Order", style: AppFonts.text16Barlow. copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              )
           ],
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
