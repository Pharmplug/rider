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

  const CustomInput({
    Key? key,
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
    this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
   
        Text(hint!,style: AppFonts.text14Inter,),
        const SizedBox(height: 4,),
        TextFormField(
          controller: myController,
          onSaved: onSaved,
          enabled: enabled,
          validator: validator,
          onChanged: onChanged,
          keyboardType: type == 'number'
              ? const TextInputType.numberWithOptions(signed: true, decimal: true)
              : TextInputType.emailAddress,
          maxLength: type == 'number' ? 13 : 100,
          obscureText: obsecure!,
          decoration: InputDecoration(
            filled: true,
            fillColor: Pallete.whiteColor,
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            counterText: "",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(width: 0.5, color: Pallete.hintText),
            ),
            enabledBorder: OutlineInputBorder(
              
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(width: 0.5, color: Pallete.hintText),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(width: 0.6, color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(width: 1, color: Colors.red),
            ),
            labelText: label,
            suffixIcon: suffixIcon,
            errorText: error,
            hintText: hint,
            hintStyle: const TextStyle(
              color: Pallete.disabledColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
            labelStyle: AppFonts.text12Inter.copyWith(
              fontSize: 12,
              color: Pallete.hintText,
            ),
          ),
        ),
      ],
    );
  }
}




class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String query = '';

  void onQueryChanged(String newQuery) {
    setState(() {
      query = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: TextField(
        onChanged: onQueryChanged,
        decoration: InputDecoration(
          labelText: 'Search',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
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
