import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.fontSize = 16,
      this.fontFamily,
      this.overflow,
      this.maxLines,
      this.fontWeight,
      this.color,
      this.textAlign,
      this.decoration});
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextOverflow? overflow;
  final int? maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: decoration,
          fontSize: fontSize,
          fontWeight: fontWeight,
          fontFamily: fontFamily,
          color: color),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
