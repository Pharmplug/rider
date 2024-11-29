import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmplug_rider/components/input_field.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/views/order/order_tracker.dart';
import '../../constants/resources.dart';


enum OrderStatus { all, newOrder, pending, delivered }

class OrderScreen extends StatefulWidget {
  const OrderScreen({ Key? key,  }) : super(key: key);

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<OrderScreen> {
  var addressFrom = "11, Mike Adenuga, Ikate, Lekki, Lagos.";
  var addressTo = "20, Ligali Ayorinde, Ikoyi, Lagos.";
  var time = "10:12AM";
  bool isSwitched = false;

OrderStatus toggleOrder = OrderStatus.all; 

  @override
  Widget build(BuildContext context) {
  final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: 
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.back,
                      scale: 2,
                    ),
                    SizedBox(width: 30,),
                    Text('Orders', style: AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(height: 30,),
                RichText(
                  text: TextSpan(
                    text: 'You have ', 
                    style: AppFonts.text14Barlow.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                    children: [
                      TextSpan(
                        text: '3',
                        style: AppFonts.text14Barlow.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Pallete.secondaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: ' new orders to deliver', 
                        style: AppFonts.text14Barlow.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                 Row(
                   children: [
                     Expanded(child: buildSearchInput()),
                     SizedBox(width: 10,),
                     Image.asset(
                      AppImages.funnel,
                      // scale: 2,
                    ),
                   ],
                 ),
                     SizedBox(height: 20,),
                 _buildToggleContainer(_getSize),
                 SizedBox(height: 30,),
                 OrderTracker(
                  // time: time,
                  // tracking: 0,
                  // orderId: orderId,
                  // isOnTransit: isSwitched,
                  // addressFrom: addressFrom,
                  // addressTo: addressTo,
                  trackers: trackers,

                  ),
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget buildSearchInput() => Container(
      decoration: BoxDecoration(
          border: Border.all(color: Pallete.disabledColor, width: 0.5),
          color: Pallete.whiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 20),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              size: 26,
              color: Pallete.hintText,
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search order id...",
                    hintStyle: AppFonts.text12InterHint),
              ),
            ),
          ],
        ),
      ),
    );


    Widget _buildToggleContainer(Size _getSize) {
    return Container(
      height: _getSize.height * 0.04,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Pallete.secondaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildToggleOption("All", OrderStatus.all, _getSize),
          _buildToggleOption("New Order", OrderStatus.newOrder, _getSize),
           Container(width: 1, height: 16, color: Colors.grey),
          _buildToggleOption("Pending", OrderStatus.pending, _getSize),
           Container(width: 1, height: 16, color: Colors.grey),
          _buildToggleOption("Delivered", OrderStatus.delivered, _getSize),
        ],
      ),
    );
  }

 Widget _buildToggleOption(String title, OrderStatus status, Size _getSize) {
  return GestureDetector(
    onTap: () {
      setState(() {
        toggleOrder = status;
      });
    },
    child: Container(
      width: _getSize.width * 0.20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: toggleOrder == status ? Colors.white : Pallete.secondaryColor,
        border: Border.all(
          color: toggleOrder == status ? Pallete.secondaryColor : Colors.transparent,
        ),
      ),
      child: Text(
        title,
        style: AppFonts.text12Barlow.copyWith(
          fontWeight: FontWeight.w600,
          color: toggleOrder == status ? Colors.black : Colors.white,
        ),
      ),
    ),
  );
}

}