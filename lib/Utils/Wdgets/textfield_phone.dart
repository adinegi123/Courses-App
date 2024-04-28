import 'package:elera/Utils/Constants/constants_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class MyTextFiledPhone extends StatefulWidget {
  final Widget? prefixIcon;
  final String hintText;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final bool? readOnly;
  final String? initialValue;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(PhoneNumber)? countryCodePickerValue;
  final String? Function(String?)? validator;
  const MyTextFiledPhone(
      {Key? key,
      this.prefixIcon,
      required this.hintText,
      this.suffixIcon,
      this.onTap,
      this.readOnly,
      this.initialValue,
      this.controller,
      this.keyboardType,
      this.countryCodePickerValue,
      this.validator})
      : super(key: key);

  @override
  State<MyTextFiledPhone> createState() => _MyTextFiledPhoneState();
}

class _MyTextFiledPhoneState extends State<MyTextFiledPhone> {
  bool focus = false;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          focus = hasFocus;
        });
      },
      child: IntlPhoneField(
        controller: widget.controller,
        showDropdownIcon: false,
        disableLengthCheck: true,
        validator: (value) {
          if (value!.number.length != 10) {
            return "Enter correct phone number";
          }
          return null;
        },
        showCountryFlag: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          isDense: true,
          fillColor: focus
              ? const Color(0xFF335EF7).withOpacity(0.2)
              : Colors.grey.shade100,
          filled: true,
          border: InputBorder.none,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.buttonColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.errorColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: ColorConst.errorColor)),
        ),
        initialCountryCode: 'IN',
        onChanged: widget.countryCodePickerValue,
      ),
    );
  }
}
