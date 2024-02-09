import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(size.width, size.height * .06),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(20))),
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
