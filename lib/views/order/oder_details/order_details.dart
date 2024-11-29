import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmplug_rider/components/buttons.dart';
import 'package:pharmplug_rider/components/input_field.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/views/order/oder_details/order_accepted.dart';
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
                  Text('Order Details',
                      style: AppFonts.text16Barlow
                          .copyWith(fontWeight: FontWeight.w600)),
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
              ButtonWithFunction(
                  text: "Accept This Order", onPressed: () => {
                     
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrdersAccepted(item: [],)))
                    
                  }),
              SizedBox(
                height: _getSize.height * 0.02,
              ),
              GestureDetector(
                 onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(), // Pass your item here
                    ),
                  );
                  },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pallete.textRed, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Reject',
                    style: AppFonts.text14Barlow.copyWith(
                        color: Pallete.textRed, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}class TrackerIcons extends StatelessWidget {
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


