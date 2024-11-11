import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pharmplug_rider/constants/app_font.dart';

import '../constants/app_colors.dart';


class CustomInput extends StatelessWidget {
  final String? hint;
  final String? label;
  final String? error;
  final TextEditingController? myController;
  final String? description;
  final String? type;
  final String? value;
  final Widget? suffixIcon;
  final bool? enabled;
  final bool? obsecure;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const CustomInput(
      {Key? key,
      this.hint,
      this.label,
      this.error,
      this.description,
      this.value,
      this.suffixIcon,
      this.enabled,
      this.obsecure = false,
      required this.onSaved,
      this.onChanged,
      this.validator,
      this.type,
      this.myController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      //maxLengthEnforced: false,
      onSaved: onSaved,
      enabled: enabled,
      //autofocus: false,
      validator: validator,
      onChanged: onChanged,

      keyboardType: type == 'number'
          ? const TextInputType.numberWithOptions(signed: true, decimal: true)
          : TextInputType.emailAddress,
      maxLength: type == 'number' ? 13 : 100,
      // controller: passwordController,
      //  textInputAction: TextInputAction.next,
      //obscure text will hide the text
      obscureText: obsecure!,
      //enableSuggestions: false,
//autocorrect: false,
      // controller: passwordController,
//autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 2, left: 8),
        counterText: "",
        focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 0.5, color: Pallete.primaryColor)),
        enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(width: 0.5, color: Pallete.primaryColor)),
        labelText: label,
        suffixIcon: suffixIcon,
        //errorMaxLines: 1,
        errorText: error,
        hintText: hint,
        hintStyle: const TextStyle(
            color: Pallete.hintText,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.none),
        labelStyle:AppFonts.text12Inter .copyWith(
          fontSize: 12,
          color: const Color(0xFF4F4F4F),
        ),

        //obscure text will hide the text
      ),
    );
  }
}


class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    }

    final intSelection = newValue.selection;
    final formattedValue = _formatNumber(newValue.text);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(
        offset: formattedValue.length -
            (oldValue.text.length - intSelection.baseOffset),
      ),
    );
  }

  String _formatNumber(String text) {
    final formatter = NumberFormat("#,###");
    final number = int.parse(text.replaceAll(RegExp(r'[^0-9]'), ''));
    return formatter.format(number);
  }
}
