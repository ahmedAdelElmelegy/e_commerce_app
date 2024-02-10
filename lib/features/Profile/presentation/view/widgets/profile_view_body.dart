import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CustomText(
            text: 'Profile',
            fontSize: RespText.getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
