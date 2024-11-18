// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/views/profile/profile.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../navbar/nav.dart';
import 'widgets/header.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}
class OrderList{
  String? name;
  String? price;
  String? noOfItems;
  String? image;
  String? caretImage;
  String? boxImage;
  String? time;
  // Color? color;

  OrderList({
    required this.name,
    required this.price,
    required this.noOfItems,
    required this.image,
    required this.caretImage,
    required this.boxImage,
    required this.time,
    // this.color,
  });
}

final List<OrderList> items = [
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  OrderList(
    name: "Julie Harrison Pharmacy Store",
    price: "₦20,700‎.00",
    noOfItems: "2 items",
    image: "assets/icons/storefront.png",
    caretImage: "assets/images/bike.png",
    boxImage: "assets/icons/boxPrimary.png",
    time: "10:12AM",
    // color: Color.fromARGB(255, 203, 238, 245),
  ),
  ];
class _EarningsState extends State<Earnings> {
  bool isTodaySelected = true;

@override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildHeader(_getSize, context,"Earning"),
                ),
                 SizedBox(height: _getSize.height * 0.025),
                _buildToggleContainer(_getSize),
                SizedBox(height: _getSize.height * 0.05),
                _buildSummary(_getSize),
                if (isTodaySelected)
                  SizedBox(height: _getSize.height * 1, child: _buildOrderList())
                else
                  _buildWeeklyView(_getSize),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildToggleContainer(Size _getSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
      
        height: _getSize.height * 0.04,
        padding: const EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Pallete.secondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildToggleOption("TODAY", true, _getSize),
            _buildToggleOption("WEEKLY", false, _getSize),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleOption(String title, bool isToday, Size _getSize) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTodaySelected = isToday;
        });
      },
      child: Container(
        width: _getSize.width * 0.40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isTodaySelected == isToday ? Colors.white : Pallete.secondaryColor,
          border: Border.all(
            color: isTodaySelected == isToday ? Pallete.secondaryColor : Colors.transparent,
          ),
        ),
        child: Text(
          title,
          style: AppFonts.text16Barlow.copyWith(
            fontWeight: FontWeight.w600,
            color: isTodaySelected == isToday ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSummary(Size _getSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tue, 8th Oct, 2024', style: AppFonts.text14Barlow.copyWith(fontWeight: FontWeight.w500)),
            SizedBox(height: _getSize.height * 0.01),
            Text('₦20,700‎.00', style: AppFonts.text16Barlow.copyWith(fontSize: 21, fontWeight: FontWeight.w700)),
          ],
        ),
        SizedBox(width: _getSize.width * 0.15),
        Container(width: 1, height: 60, color: Colors.grey),
        SizedBox(width: _getSize.width * 0.15),
        Column(
          children: [
            Text('Trips', style: AppFonts.text14Barlow.copyWith(fontWeight: FontWeight.w500)),
            SizedBox(height: _getSize.height * 0.01),
            Text('07', style: AppFonts.text16Barlow.copyWith(fontSize: 21, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderList() {
    final _getSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
          child: Text("Today's Order", style: AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600)),
        ),
        Container(
          height: _getSize.height * 0.7,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: _buildOrderRow(index, _getSize),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _caretForward() {
    final _getSize = MediaQuery.of(context).size;
    return Image.asset(
      AppImages.caretForward,
      width: _getSize.width * 0.07,
      scale: 1,
    );
  }

  Widget _buildOrderImage(int index) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Pallete.primaryColor,
      ),
      child: Image.asset(
        items[index].image!,
        scale: 4,
      ),
    );
  }

  Widget _buildProductName(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          items[index].name!,
          style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildPrice(int index) {
    return Text(items[index].price!,
        style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w500));
  }

  Widget _buildLocation(int index) {
    final _getSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset(
          items[index].caretImage!,
          scale: 1,
        ),
        SizedBox(
          width: _getSize.width * 0.01,
        ),
        Text('2.1km',
            style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w700))
      ],
    );
  }

  Widget _buildNoOfItems(int index) {
    final _getSize = MediaQuery.of(context).size;

    return Row(
      children: [
        Image.asset(
          items[index].boxImage!,
          scale: 2,
        ),
        SizedBox(
          width: _getSize.width * 0.01,
        ),
        Text(
          '2 items',
          style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Widget _buildTime(int index) {
    return Text(items[index].time!,
        style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w500));
  }
  Widget _buildOrderRow(int index, Size _getSize) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _buildOrderImage(index),
                      SizedBox(width: _getSize.width * 0.03),
                      _buildProductName(index),
                    ],
                  ),
                  SizedBox(height: _getSize.height * 0.01),
                  Row(
                    children: [
                      _buildLocation(index),
                      SizedBox(width: _getSize.width * 0.05),
                      _buildNoOfItems(index),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildPrice(index),
                    SizedBox(width: _getSize.width * 0.01),
                    _caretForward(),
                  ],
                ),
                SizedBox(height: _getSize.height * 0.002),
                _buildTime(index),
              ],
            ),
          ],
        ),
        SizedBox(height: _getSize.height * 0.01),
        Divider(color: Colors.black12),
      ],
    );
  }

  Widget _buildWeeklyView(Size _getSize) {
    return Column(
      children: [
        SizedBox(height: _getSize.height * 0.55, child: _buildBarChart()),
        _buildOrderList(),
      ],
    );
  }


  Widget _buildBarChart() {
    String selectedValue = 'Weekly';

    final _getSize = MediaQuery.of(context).size;

    // Sample data corresponding to Y-axis values in thousands
    final List<double> barData = [16, 5, 10, 15, 20, 25, 10];
    final double maxValue = barData.reduce((a, b) => a > b ? a : b);  
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            children: [
              // Row with 'Total Earnings' and dropdown
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Earnings',
                        style: AppFonts.text14Barlow
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: _getSize.height * 0.01,
                      ),
                      Text('₦20,700‎.00',
                          style: AppFonts.text16Barlow.copyWith(
                              fontSize: 21, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                    decoration: BoxDecoration(
                      color: Color(0xFFF2F4F7),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey, width: 0.2),
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        // String? newValue = await showMenu<String>(
                        //   context: context,
                        //   position: RelativeRect.fromLTRB(100, 100, 0, 0),
                        //   items: [
                        //     PopupMenuItem(
                        //       value: 'Weekly',
                        //       child: Text('Weekly', style: AppFonts.text12Barlow),
                        //     ),
                        //     PopupMenuItem(
                        //       value: 'Monthly',
                        //       child: Text('Monthly', style: AppFonts.text12Barlow),
                        //     ),
                        //   ],
                        // );
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(selectedValue, style: AppFonts.text12Barlow),
                          SizedBox(
                            width: _getSize.width * 0.01,
                          ),
                          Image.asset(
                            AppImages.arrowDown,
                            scale: 2,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: _getSize.height * 0.005,
              ),

              SizedBox(
                width: double.infinity,
                child: Divider(
                  color: Colors.black12,
                  thickness: 1,
                ),
              ),

              SizedBox(
                height: _getSize.height * 0.015,
              ),

              SizedBox(
                height: 310,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 25, // Ensure maxY matches the highest Y-axis value
                    barGroups: [
                      for (int i = 0; i < barData.length; i++)
                        BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: barData[i],
                              color: barData[i] == maxValue ? Colors.blue : const Color.fromARGB(255, 156, 218, 247),
                              width: 30,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  topRight: Radius.circular(4)),
                            ),
                          ],
                        ),
                    ],
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      drawHorizontalLine: true,
                    ),

                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 5,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('0',
                                    style: AppFonts.text12Barlow
                                        .copyWith(fontWeight: FontWeight.w500));
                              case 5:
                                return Text('5k',
                                    style: AppFonts.text12Barlow
                                        .copyWith(fontWeight: FontWeight.w500));
                              case 10:
                                return Text('10k',
                                    style: AppFonts.text12Barlow
                                        .copyWith(fontWeight: FontWeight.w500));
                              case 15:
                                return Text('15k',
                                    style: AppFonts.text12Barlow
                                        .copyWith(fontWeight: FontWeight.w500));
                              case 20:
                                return Text('20k',
                                    style: AppFonts.text12Barlow
                                        .copyWith(fontWeight: FontWeight.w500));
                              case 25:
                                return Text(
                                  '25k',
                                  style: AppFonts.text12Barlow
                                      .copyWith(fontWeight: FontWeight.w500),
                                );
                              default:
                                return Container();
                            }
                          },
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide top titles
                      ),
                      rightTitles: AxisTitles(
                        sideTitles:
                            SideTitles(showTitles: false), // Hide right titles
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = [
                              "MON",
                              "TUE",
                              "WED",
                              "THU",
                              "FRI",
                              "SAT",
                              "SUN"
                            ];
                            return Text(days[value.toInt()], style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w500),);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                  ),
                ),
              )
              
              ]))));
}
}

