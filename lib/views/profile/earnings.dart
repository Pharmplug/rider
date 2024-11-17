// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import '../../constants/app_font.dart';

class Earnings extends StatefulWidget {
  const Earnings({super.key});

  @override
  State<Earnings> createState() => _EarningsState();
}

class _EarningsState extends State<Earnings> {
  bool isTodaySelected = true;

  final List<Map<String, dynamic>> items = [
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
    {
      "name": "Julie Harrison Pharmacy Store",
      "price": "₦20,700‎.00",
      "noOfItems": "2 items",
      "image": "assets/icons/storefront.png",
      'caretImage': "assets/images/bike.png",
      'boxImage': "assets/icons/boxPrimary.png",
      "time": "10:12AM"
      // "color": Color.fromARGB(255, 203, 238, 245)
    },
  ];

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: Stack(children: [
        SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.back,
                    width: _getSize.width * 0.15,
                    scale: 2,
                    // fit: BoxFit.cover,
                  ),
                  Text('Earnings',
                      style: AppFonts.text16Barlow
                          .copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  width: _getSize.width * 0.9,
                  height: _getSize.height * 0.04,
                  // Main container width
                  padding: const EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Pallete.secondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 'Today' container
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTodaySelected = true;
                          });
                        },
                        child: Container(
                          width: _getSize.width * 0.45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isTodaySelected
                                  ? Colors.white
                                  : Pallete.secondaryColor,
                              border: isTodaySelected
                                  ? Border.all(color: Pallete.secondaryColor)
                                  : Border.all(color: Colors.transparent)),
                          child: Text('TODAY',
                              style: isTodaySelected
                                  ? AppFonts.text16Barlow
                                      .copyWith(fontWeight: FontWeight.w500)
                                  : AppFonts.text16Barlow.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                        ),
                      ),
                      // 'Weekly' container
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTodaySelected = false;
                            });
                          },
                          child: Container(
                            width: _getSize.width * 0.45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: !isTodaySelected
                                  ? Colors.white
                                  : Pallete.secondaryColor,
                              border: Border.all(
                                color: !isTodaySelected
                                    ? Pallete.secondaryColor
                                    : Colors.transparent,
                              ),
                            ),
                            child: Text('WEEKLY',
                                style: !isTodaySelected
                                    ? AppFonts.text16Barlow
                                        .copyWith(fontWeight: FontWeight.w500)
                                    : AppFonts.text16Barlow.copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: _getSize.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tue, 8th Oct, 2024',
                          style: AppFonts.text14Barlow
                              .copyWith(fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: _getSize.height * 0.01,
                      ),
                      Text('₦20,700‎.00',
                          style: AppFonts.text16Barlow.copyWith(
                              fontSize: 21, fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(
                    width: _getSize.width * 0.1,
                  ),
                  // Divider line
                  Container(
                    width: 1,
                    height: 60,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: _getSize.width * 0.15,
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text('Trips',
                              style: AppFonts.text14Barlow
                                  .copyWith(fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: _getSize.height * 0.01,
                          ),
                          Text('07',
                              style: AppFonts.text16Barlow.copyWith(
                                  fontSize: 21, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ],
                  )
                ],
              ),

              // Conditionally render Order List or Bar Chart based on isTodaySelected
              if (isTodaySelected)
                SizedBox(height: _getSize.height * 1, child: _buildOrderList())
              else
                Column(
                  children: [
                    SizedBox(
                      height: _getSize.height * 0.7,
                      child: _buildBarChart(),
                    ),
                    _buildOrderList()
                  ],
                ),
            ],
          ),
        )),
      ]),
    );
  }

  Widget _buildOrderList() {
    final _getSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 30),
          child: Text("Today's Order",
              style:
                  AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600)),
        ),
        // Container with fixed height to hold the ListView.builder
        Container(
          height: _getSize.height * 0.7,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Column: Image, Product Details, Distance, and No of Items
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _buildOrderImage(index),
                                  SizedBox(width: _getSize.width * 0.03),
                                  Expanded(child: _buildProductName(index)),
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
                        // Second Column: Price, Caret, and Time
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
                    // Divider line
                    Divider(color: Colors.grey),
                  ],
                ),
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
        items[index]["image"]!,
        scale: 4,
      ),
    );
  }

  Widget _buildProductName(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          items[index]["name"]!,
          style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildPrice(int index) {
    return Text(items[index]["price"]!,
        style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w500));
  }

  Widget _buildLocation(int index) {
    final _getSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Image.asset(
          items[index]["caretImage"]!,
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
          items[index]["boxImage"]!,
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
    return Text(items[index]["time"]!,
        style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w500));
  }

  Widget _buildBarChart() {
    String selectedValue = 'Weekly';

    final _getSize = MediaQuery.of(context).size;

    // Sample data corresponding to Y-axis values in thousands
    final List<double> barData = [16, 5, 10, 15, 20, 25, 10];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black26, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
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
                height: _getSize.height * 0.04,
              ),
              Expanded(
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: 25, // Ensure maxY matches the highest Y-axis value
                    barGroups: [
                      for (int i = 0; i < barData.length; i++)
                        BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: barData[i],
                              color: Color(0XFFCDEFF5),
                              width: 30,
                              borderRadius: BorderRadius.zero,
                            ),
                          ],
                        ),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 5,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 0:
                                return Text('0');
                              case 5:
                                return Text('5k');
                              case 10:
                                return Text('10k');
                              case 15:
                                return Text('15k');
                              case 20:
                                return Text('20k');
                              case 25:
                                return Text('25k');
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
                              "Mon",
                              "Tue",
                              "Wed",
                              "Thu",
                              "Fri",
                              "Sat",
                              "Sun"
                            ];
                            return Text(days[value.toInt()]);
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
