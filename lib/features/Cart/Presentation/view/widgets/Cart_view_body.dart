import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomText(
            text: 'Cart',
            fontSize: RespText.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
