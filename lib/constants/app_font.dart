import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppFonts {
    static TextStyle text14InterLight = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 10,
      color: Pallete.text,
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle text14Inter = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.text,
      fontWeight: FontWeight.w400,
    ),
  );
    static TextStyle text14InterHint = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.hintText,
      fontWeight: FontWeight.w300,
    ),
  );
    static TextStyle text16Inter = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Pallete.text,
      fontWeight: FontWeight.bold,
    ),
  );
  static TextStyle text12Inter = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Pallete.text,
      fontWeight: FontWeight.w300,
    ),
  );
    static TextStyle text12InterHint = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 12,
      color: Pallete.hintText,
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle text14InterGreen = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.secondaryColor,
      fontWeight: FontWeight.w400,
    ),
  );
  static TextStyle text14InterWhite = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.whiteColor,
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle boldText14HintInter = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 14,
      color: Pallete.hintText,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle boldText16HintInter = GoogleFonts.inter(
    textStyle: const TextStyle(
      fontSize: 16,
      color: Pallete.text,
      fontWeight: FontWeight.w600,
    ),
  );
}
