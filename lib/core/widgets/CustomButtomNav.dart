import 'package:e_commerce_app/core/utils/Constant.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:e_commerce_app/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class CustomButtomNav extends StatelessWidget {
  const CustomButtomNav({
    super.key,
    this.onPressed,
    required this.text1,
    required this.text2,
  });
  final void Function()? onPressed;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: text2,
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
        TextButton(
            onPressed: onPressed,
            child: CustomText(
              text: text1,
              color: Constant.defaultColor,
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }
}
