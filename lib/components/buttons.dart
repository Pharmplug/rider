import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../constants/app_font.dart';


class ButtonWithFuction extends StatelessWidget {
  const ButtonWithFuction({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontS = 18,
    this.disabled,
  }) : super(key: key);

  final String text;
  final bool? disabled;
  final double? fontS; // Use '?' for the nullable type
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: disabled != null && disabled! ? Pallete.disabledColor : Colors.white, shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          backgroundColor:
              disabled != null && disabled! ? Pallete.hintText : Colors.black,
          shadowColor: const Color.fromARGB(56, 148, 148, 148),
          elevation: 5,
          textStyle: AppFonts.text14InterWhite.copyWith(fontSize: fontS),
        ),
        onPressed: disabled != null && disabled! ? null : onPressed,
        child: Text(
          text,
          style: AppFonts.text14InterWhite.copyWith(fontSize: 18),
        ),
      ),
    );
  }
}

