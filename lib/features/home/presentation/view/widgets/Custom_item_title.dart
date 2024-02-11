import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomItemtTitle extends StatelessWidget {
  const CustomItemtTitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: RespText.getResponsiveFontSize(context, 23),
          fontWeight: FontWeight.bold,
        ),
        CustomText(
          text: 'View All',
          fontSize: RespText.getResponsiveFontSize(context, 16),
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        )
      ],
    );
  }
}
