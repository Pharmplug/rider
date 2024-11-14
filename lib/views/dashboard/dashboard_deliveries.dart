import 'package:flutter/material.dart';
import 'package:pharmplug_rider/models/recent_deliveries.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_font.dart';

class DashboardDeliveries extends StatelessWidget {
  final List<Order> orders;

  const DashboardDeliveries({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final getSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: getSize.height * 0.46,
        decoration: BoxDecoration(
            color: Pallete.backgroundColor,
            border: Border.all(width: 0.6, color: Pallete.disabledColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Delivery",
                    style: AppFonts.text16Barlow
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See All",
                    style: AppFonts.text14Barlow.copyWith(
                        color: Pallete.secondaryColor,
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationColor: Pallete.secondaryColor),
                  ),
                ],
              ),
           SizedBox(height: getSize.height*0.025,),
         buildSearchInput(),
             SizedBox(height: getSize.height*0.025,),
              SizedBox(
                height: getSize.height * 0.28,
                child: ListView.builder(
                    itemCount: orders.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 8),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: getSize.width * 0.1,
                                  child: Image.asset(
                                    scale: 0.5,
                                    orders[index].img,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orders[index].name,
                                      style: AppFonts.text12Barlow
                                          .copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "ID:  ",
                                          style: AppFonts.text12Barlow.copyWith(
                                            color: Pallete.hintText,
                                          ),
                                        ),
                                        Text(
                                          orders[index].id,
                                          style: AppFonts.text14Barlow.copyWith(
                                            color: Pallete.text,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: getSize.width * 0.21,
                                      decoration: BoxDecoration(
                                        color: orders[index].completed
                                            ? Color(0xFF175CD3).withOpacity(0.1)
                                            : Pallete.secondaryColor
                                                .withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2, horizontal: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.circle_rounded,
                                              size: 12,
                                              color: orders[index].completed
                                                  ? Color(0xFF175CD3)
                                                  : Color(0xFF027A48),
                                            ),
                                            Text(
                                            orders[index].completed?  "On Transit":"Delivered",
                                              style: AppFonts.text12Barlow.copyWith(
                                                color: orders[index].completed
                                                    ? Color(0xFF175CD3)
                                                    : Color(0xFF027A48),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: getSize.height * 0.005),
                                    Text(
                                     "#${ orders[index].amount}",
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
                        
                        SizedBox(height: getSize.height*0.015,), Container(color: const Color.fromARGB(255, 210, 212, 215),height: getSize.height*0.001,width: getSize.width,)
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget buildSearchInput() => Container(
    decoration: BoxDecoration(
      border: Border.all(color: Pallete.disabledColor,width: 0.5),
        color: Pallete.whiteColor, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 20),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            size: 30,
            color: Pallete.text,
          ),
          Flexible(
            child: TextField(
              decoration: InputDecoration(border: InputBorder.none,hintText: "Search order id...",hintStyle: AppFonts.text12InterHint),
            ),
          ),
        ],
      ),
    ),
  );