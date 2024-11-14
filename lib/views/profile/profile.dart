// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pharmplug_rider/constants/app_colors.dart';
import 'package:pharmplug_rider/constants/app_images.dart';
import 'package:pharmplug_rider/views/profile/earnings.dart';

import '../../components/buttons.dart';
import '../../components/input_field.dart';
import '../../constants/app_font.dart';
import '../../constants/app_images.dart';
import '../../constants/app_routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final _getSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Pallete.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  AppImages.back,
                  width: _getSize.width * 0.15,
                  scale: 2,
                  // fit: BoxFit.cover,
                ),
                Expanded(
                    child:
                        Text('My Profile', style: AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600))),
                Image.asset(
                  AppImages.edit,
                  width: _getSize.width * 0.2,
                  scale: 2,
                  // fit: BoxFit.cover,
                ),
              ],
            ),
            Column(children: [
              Image.asset(
                AppImages.profilePic,
                scale: 2,
              ),
              SizedBox(
                height: _getSize.height * 0.01,
              ),
              Text('Adedapo Samad', style: AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600)),
              SizedBox(
                height: _getSize.height * 0.01,
              ),
              Text(
                'adedapo.samad@gmail.com',
                style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: _getSize.height * 0.01,
              ),
              Text(
                '+234-1234-5678',
                style: AppFonts.text12Barlow.copyWith(fontWeight: FontWeight.w400),
              )
            ]),
            SizedBox(
              height: _getSize.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  width: _getSize.width * 0.38,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 2, color: Colors.black12)),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFECFDF3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImages.box,
                            scale: 3.5,
                          ),
                          SizedBox(
                            width: _getSize.width * 0.01,
                          ),
                          Text(
                            'Total Ordes Delivered',
                            style: AppFonts.text12Barlow.copyWith(color: Color(0XFF027A48)),
                          )
                        ],
                      ),
                       SizedBox(
                  height: _getSize.height * 0.02,
                ),
                      Text(
                        '350',
                        style: AppFonts.text15OpenSans.copyWith(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: _getSize.width * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  width: _getSize.width * 0.38,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 2, color: Colors.black12)),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0XFFEBFCCD)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImages.star,
                            scale: 2,
                          ),
                          SizedBox(
                            width: _getSize.width * 0.01,
                          ),
                          Text(
                            'Average Rating',
                            style: AppFonts.text12Barlow.copyWith(color: Color(0XFF027A48),),
                          )
                        ],
                      ),
                      SizedBox(
                  height: _getSize.height * 0.02,
                ),
                      Text(
                        '4.5',
                        style: AppFonts.text15OpenSans.copyWith(fontWeight: FontWeight.w700),

                      )
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
               onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Earnings()));
                  },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: _getSize.width * 0.78,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0XFFEBF9FB),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.cashHand,
                        scale: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImages.wallet,
                                  scale: 4,
                                  // width: _getSize.width * 0.05,
                                ),
                                SizedBox(
                                width: _getSize.width * 0.01,
                              ),
                                Text(
                                  'Total Earnings',
                                  style: AppFonts.text12Barlow.copyWith(color: Pallete.primaryColor, fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                            SizedBox(
                              height: _getSize.height * 0.02,
                            ),
                            Text(
                              '₦600,700‎.00',
                              style: AppFonts.text15OpenSans.copyWith(fontWeight: FontWeight.w700, color: Pallete.primaryColor),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: _getSize.height * 0.005,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              width: _getSize.width * 0.78,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color: Color(0XFFEBF9FB),
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.rep, scale: 4,
                  width: _getSize.width * 0.08,),
                  Expanded(child: Text('Support', style: AppFonts.text14Barlow.copyWith(color: Pallete.primaryColor))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Image.asset(
                      AppImages.caretRight,
                      scale: 2,
                      ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
