import 'package:e_commerce_app/features/SignUp/presentaton/view/widgets/Sign_Up_View_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SignUpViewBody(),
      ),
    );
  }
}
