import 'package:flutter/material.dart';

class AppTextFormFeilds extends StatelessWidget {
  const AppTextFormFeilds({
    Key? key,
    required this.hintText,
    required this.feildIcon,
    required this.isPasswordFeild,
    required this.controller,
    this.hintTextStyle,
    this.textStyle,
    this.isFilled,
    this.fillColor,
    this.borderDecoration,
  }) : super(key: key);
  final String hintText;
  final IconData feildIcon;
  final bool isPasswordFeild;
  final TextEditingController controller;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final bool? isFilled;
  final Color? fillColor;
  final InputBorder? borderDecoration;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPasswordFeild,
      style: textStyle ??
          const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        isDense: true,
        focusColor: Colors.white,
        fillColor: fillColor ?? Colors.grey,
        hintText: hintText,
        hintStyle: hintTextStyle ?? const TextStyle(color: Colors.white),
        filled: isFilled ?? false,
        focusedBorder: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
        enabledBorder: borderDecoration ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
        prefixIcon: Icon(
          feildIcon,
          color: Colors.white,
        ),
      ),
    );
  }
}