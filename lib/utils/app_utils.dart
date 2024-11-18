import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_font.dart';
import 'loader.dart';

class AppUtils {
 
  static void showSnackBarMessage(String message, BuildContext context) {
    final snackBar = SnackBar(
      elevation: 2,
      content: Text(message,
          style: const TextStyle(
              fontFamily: "AccordAlternate", color: Colors.white),
          textAlign: TextAlign.center),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.black54,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static dynamic showAlertDialog(
    BuildContext context,
    String titleText,
    String contentText,
    String confirmText,
    String cancelText,
    Function() confirmFunction,
  ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.text12Inter
            .copyWith(color: Pallete.text, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    Widget confirmButton = TextButton(
      onPressed: confirmFunction,
      child: Text(
        confirmText,
        style: AppFonts.text12Inter
            .copyWith(fontWeight: FontWeight.w600, color: Pallete.primaryColor),
      ),
    );

    // title
    Widget title = Center(
      child: Text(
        titleText,
        style: AppFonts.text12Barlow.copyWith(
          fontWeight: FontWeight.w600,
          color: Pallete.primaryColor,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.text12Inter.copyWith(fontSize: 13),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                  confirmButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

    static dynamic errorDialog(BuildContext context, String titleText,
      String contentText, String cancelText, Widget Icon) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(
        cancelText,
        style: AppFonts.text12Inter
            .copyWith(color: Pallete.black, fontSize: 12),
      ),
      onPressed: () => Navigator.of(context).pop(),
    );

    // title
    Widget title = Center(
      child: Column(
        children: [
          Icon,
          const SizedBox(
            height: 8,
          ),
          Text(
            titleText,
            style: AppFonts.boldText14HintInter.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    // content
    Widget content = Text(
      contentText,
      style: AppFonts.text12Inter.copyWith(fontSize: 11, color: Pallete.text),
      textAlign: TextAlign.center,
    );

    // set up the AlertDialog
    dynamic alert = Platform.isIOS
        ? CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                ],
              )
            ],
          )
        : AlertDialog(
            title: title,
            content: content,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
            ),
            backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  cancelButton,
                ],
              )
            ],
          );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  
    static void showLoader(context) {
    showDialog(
      context: context,
      builder: (ctx) => const Loader(),
    );
  }
}