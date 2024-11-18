
  import 'package:flutter/material.dart';


import '../../../constants/app_font.dart';
import '../../../constants/app_images.dart';
import '../../navbar/nav.dart';
import '../profile.dart';

Widget buildHeader(Size _getSize, BuildContext context,String text) {
    return Row(

      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NavBar(
                            initialScreen: const Profile(), initialTab: 2)),
            );
          },
          child: Image.asset(
            AppImages.back,
            width: _getSize.width * 0.065,
         
          ),
        ),SizedBox( width: 24,),
        Text(
          text,
          style: AppFonts.text16Barlow.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
