import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_font.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

class DashboardHeader extends StatelessWidget {
  final bool amountVisible;
  final String amount;
  final bool isSwitched;
  final VoidCallback toggleAmountVisibility;
  final ValueChanged<bool> toggleSwitch;
  final String name;

  const DashboardHeader({
    Key? key,
    required this.amountVisible,
    required this.amount,
    required this.isSwitched,
    required this.toggleAmountVisibility,
    required this.toggleSwitch,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Pallete.backgroundColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(40, 158, 158, 158).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:  24.0,vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Hello $name,", style: AppFonts.text18Inter),
                Container(
                  decoration: const BoxDecoration(
                    color: Pallete.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications_on_outlined,color: Pallete.whiteColor,),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Your Earnings", style: AppFonts.text12Inter),
                        SizedBox(width: _getSize.width * 0.02),
                        Icon(
                          Icons.info_outline_rounded,
                          color: Pallete.primaryColor,
                          weight: 0.5,
                          size: _getSize.width * 0.04,
                        ),
                      ],
                    ),
                    SizedBox(height: _getSize.height * 0.005),
                    GestureDetector(
                      onTap: toggleAmountVisibility,
                      child: Row(
                        children: [
                          Text(
                              '₦$amount',
                            overflow: TextOverflow.ellipsis,
                            style: AppFonts.text16Inter.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: _getSize.width * 0.05,
                            ),
                          ),
                          SizedBox(width: _getSize.width * 0.015),
                          Icon(
                            amountVisible
                                ? Icons.visibility_outlined
                                : Icons.visibility_off,
                            color: Pallete.hintText.withOpacity(0.5),
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _getSize.height * 0.015),
                    Row(
                      children: [
                        Container(
                          width: _getSize.width * 0.18,
                          decoration: BoxDecoration(
                            color: isSwitched
                                ? Pallete.secondaryColor2.withOpacity(0.1)
                                : Pallete.textRed.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.bolt,
                                  color: isSwitched
                                      ? Pallete.secondaryColor2
                                      : Pallete.textRed,
                                ),
                                Text(
                                 isSwitched? "Online":"Offline",
                                  style: AppFonts.text12Barlow.copyWith(
                                    color: isSwitched
                                        ? Pallete.secondaryColor2
                                        : Pallete.textRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: _getSize.width * 0.025),
                        FlutterSwitch(
                          height: 22.0,
                          width: 35.0,
                          padding: 1.0,
                          toggleSize: 18.0,
                          borderRadius: 10.0,
                          activeColor: Color(0xFF0F973D),
                          value: isSwitched,
                          onToggle: toggleSwitch,
                        ),
                      ],
                    ),
                    SizedBox(height: _getSize.height * 0.01),
                    Text("Open to delivery", style: AppFonts.text12Barlow),
                  ],
                ),
                Image.asset(
                  AppImages.rider,
                  width: _getSize.width * 0.45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
