import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pharmplug_rider/constants/app_routes.dart';
import 'package:pharmplug_rider/models/track_orders.dart';
import 'package:pharmplug_rider/utils/local_storage.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_accepted.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_details.dart';

class OrderTracker extends StatelessWidget {
  final List<Tracker> trackers;

  // final bool isOnTransit;
  // final String orderId;
  // final String addressFrom;
  // final String addressTo;
  // final String time;
  // final int tracking;
  // final String atTheStore;

  const OrderTracker({
    Key? key,
    required this.trackers,
    // required this.orderId,
    // required this.tracking,
    // required this.isOnTransit,
    // required this.addressFrom,
    // required this.addressTo,
    // required this.time,
    // required this.atTheStore
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;

    return Container(
      height: _getSize.height * 200,
      child: ListView.builder(
          itemCount: trackers.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: SizedBox(
                  // height: _getSize.height * 0.3,
                  child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    // height: _getSize.height * 0.27,
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                                        borderRadius:
                                            BorderRadius.circular(100),
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
                          SizedBox(
                            height: _getSize.height * 0.025,
                          ),
                          Row(
                            children: [
                              if (index == 0) ...[
                                // Show Accept and Reject buttons for the first tracker
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderDetailsScreen(items: [])));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Pallete.secondaryColor2,
                                    ),
                                    child: Text(
                                      'Accept',
                                      style: AppFonts.text12Barlow.copyWith(
                                        color: Pallete.whiteColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: _getSize.width * 0.020,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 24,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Pallete.textRed,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Text(
                                    'Reject',
                                    style: AppFonts.text12Barlow.copyWith(
                                      color: Pallete.textRed,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ] else ...[
                                // Show a single button for other trackers
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                      color: _getStatusColor(
                                          trackers[index].status),
                                    ),
                                    color: _getStatusBackgroundColor(
                                        trackers[index].status),
                                  ),
                                  child: Row(
                                    children: [
                                      _getStatusIcon(trackers[index]
                                          .status), // Conditional Icon
                                      SizedBox(width: 8),
                                      Text(
                                        trackers[index]
                                            .status, // Display the tracker status
                                        style: AppFonts.text12Barlow.copyWith(
                                          color: _getStatusTextColor(
                                              trackers[index].status),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              Spacer(),
                              // SizedBox(
                              //   width: _getSize.width * 0.1,
                              // ),
                              Column(
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      AppImages.mopedGreen,
                                    ),
                                    SizedBox(
                                      width: _getSize.width * 0.01,
                                    ),
                                    Text(
                                      trackers[index].distance,
                                      style: AppFonts.text12Barlow,
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(
                                width: _getSize.width * 0.04,
                              ),
                              Column(
                                children: [
                                  Row(children: [
                                    Image.asset(
                                      AppImages.boxSecondary,
                                      scale: 2,
                                    ),
                                    SizedBox(
                                      width: _getSize.width * 0.01,
                                    ),
                                    Text(
                                      "${trackers[index].noOfItems} items",
                                      style: AppFonts.text12Barlow,
                                    ),
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            );
          }),
    );
  }
}

class TrackerIcons extends StatelessWidget {
  const TrackerIcons({
    super.key,
    required Size getSize,
    required this.icon,
    this.distance,
    required this.containerColor,
  }) : _getSize = getSize;

  final Size _getSize;
  final Widget icon;
  final Widget? distance;
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
        distance ?? const SizedBox()
      ],
    );
  }
}

Color _getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'delivered':
      return Color(0XFF027A48);
    case 'on transit':
      return Color(0XFF6941C6);
    case 'at the store':
      return Color(0XFF026AA2);
    case 'to pickup':
      return Color(0XFFC4320A);
    case 'accepted':
      return Color(0XFF344054);
    default:
      return Color(0XFF027A48); // Default color
  }
}

Color _getStatusBackgroundColor(String status) {
  switch (status.toLowerCase()) {
    case 'delivered':
      return Color(0XFFECFDF3);
    case 'on transit':
      return Color(0XFFE6EEFC);
    case 'at the store':
      return Color(0XFF0F9FF);
    case 'to pickup':
      return Color(0XFFFFF6ED);
    case 'accepted':
      return Color(0XFFF2F4F7);
    default:
      return Color(0XFFECFCF3); // Default background
  }
}

Color _getStatusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'delivered':
      return Color(0XFF027A48);
    case 'on transit':
      return Color(0XFF175CD3);
    case 'at the store':
      return Color(0XFF6941C6);
    case 'to pickup':
      return Color(0XFF344054);
    case 'accepted':
      return Color(0XFF344054);
    default:
      return Color(0XFF027A48); // Default text color
  }
}

Widget _getStatusIcon(String status) {
  switch (status.toLowerCase()) {
    case 'delivered':
      return Image.asset(AppImages.boxSecondary,
          scale: 2, color: Color(0XFF027A48));
    case 'on transit':
      return Image.asset(AppImages.moped, scale: 5, color: Color(0XFF175CD3));
    case 'at the store':
      return Image.asset(AppImages.storefront,
          scale: 5, color: Color(0XFF6941C6)); 
    case 'to pickup':
      return Image.asset(AppImages.moped, scale: 5, color: Color(0XFFFF69B4));
    case 'accepted':
      return Image.asset(AppImages.moped,
          scale: 5, color: Color(0XFF344054)); 
    default:
      return Icon(Icons.help_outline,
          color: Color(0XFF027A48)); 
  }
}
