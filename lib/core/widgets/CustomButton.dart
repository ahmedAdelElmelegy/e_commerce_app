import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.onPressed, required this.text, required this.color});
  final void Function()? onPressed;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          minimumSize: Size(size.width, size.height * .06),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40))),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        fontSize: RespText.getResponsiveFontSize(context, 18),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
