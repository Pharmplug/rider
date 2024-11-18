import 'package:flutter/material.dart';
import 'package:pharmplug_rider/views/order/order.dart';
import 'package:pharmplug_rider/views/profile/profile.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';
import '../dashboard/dashboard.dart';

class NavBar extends StatefulWidget {
  final Widget initialScreen;
  final int initialTab;
  NavBar({Key? key, required this.initialScreen, required this.initialTab})
      : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //set current tab to starting index
  int currentTab = 0;

  //this is a list of all screents passed into a list that takes widget
  final List<Widget> screens = [
    Dashboard(),
  ];

//declaring pagestorage state
  final PageStorageBucket _bucket = PageStorageBucket();

  //Widget currentScreen = Dashboard();

  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    // Set the initial screen provided through the parameter
    currentScreen = widget.initialScreen;
    currentTab = widget.initialTab;
  }

  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Pallete.backgroundColor,
        body:
            //this page storage bucket helps to store each page state in memory
            PageStorage(bucket: _bucket, child: currentScreen),
        //set bottomnavbar
        bottomNavigationBar: BottomAppBar(
            //asign shape to navabr
            color: Pallete.backgroundColor,
            shape: const CircularNotchedRectangle(),
            //set shape to 10px round
            notchMargin: 2,
            child: SizedBox(
              height: _getSize.height * 0.085,
              width: _getSize.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MaterialButton(
                      minWidth: _getSize.width * 0.10,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Dashboard();
                          currentTab = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          currentTab == 0
                              ? Image.asset(
                                  AppImages.home,
                                  color: Pallete.primaryColor,
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  AppImages.home,
                                  color: Pallete.disabledColor,
                                  width: 20,
                                  height: 20,
                                ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Home',
                              style: TextStyle(
                                fontSize: _getSize.height * 0.012,
                                fontWeight:
                                    currentTab == 0 ? FontWeight.bold : null,
                                color: currentTab == 0
                                    ? Pallete.primaryColor
                                    : Pallete.disabledColor,
                              )),
                        ],
                      ),
                    ),
                    MaterialButton(
                      minWidth: _getSize.width * 0.10,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Order();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          currentTab == 1
                              ? Image.asset(
                                  AppImages.box,
                                  color: Pallete.primaryColor,
                                  width: 20,
                                  height: 20,
                                )
                              : Image.asset(
                                  AppImages.box,
                                  color: Pallete.disabledColor,
                                  width: 20,
                                  height: 20,
                                ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Orders',
                              style: TextStyle(
                                fontSize: _getSize.height * 0.012,
                                fontWeight:
                                    currentTab == 1 ? FontWeight.bold : null,
                                color: currentTab == 1
                                    ? Pallete.primaryColor
                                    : Pallete.disabledColor,
                              )),
                        ],
                      ),
                    ),
                MaterialButton(
                      minWidth: _getSize.width * 0.10,
                      onPressed: () {
                        setState(() {
                          currentScreen = const Profile();
                          currentTab = 4;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImages.user,
                            color: currentTab == 4
                                ? Pallete.primaryColor
                                : Pallete.disabledColor,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text('Profile',
                              style: TextStyle(
                                fontSize: _getSize.height * 0.012,
                                fontWeight:
                                    currentTab == 4 ? FontWeight.bold : null,
                                color: currentTab == 4
                                    ? Pallete.primaryColor
                                    : Pallete.disabledColor,
                              )),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}
