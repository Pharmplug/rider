import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../constants/app_font.dart';



class ButtonWithFunction extends StatelessWidget {
  const ButtonWithFunction({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontS = 18,
    this.disabled,
  }) : super(key: key);

  final String text;
  final bool? disabled;
  final double? fontS;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: disabled != null && disabled! ? Colors.grey : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          backgroundColor: disabled != null && disabled! ? Colors.grey[400] : Pallete.primaryColor,
          shadowColor: const Color.fromARGB(56, 148, 148, 148),
          elevation: 5,
          textStyle: AppFonts.text14Inter 
        ),
        onPressed: disabled != null && disabled! ? null : onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontS,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
