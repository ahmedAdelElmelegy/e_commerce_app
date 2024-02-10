import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CategorizeViewBody extends StatelessWidget {
  const CategorizeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomText(
            text: 'Categorize',
            fontSize: RespText.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
