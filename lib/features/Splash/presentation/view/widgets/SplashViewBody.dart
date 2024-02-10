import 'package:e_commerce_app/core/utils/Constant.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/features/SignUp/presentaton/view/Sign_up.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_view.dart';
import 'package:e_commerce_app/features/layout/presentation/view/layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Constant.token != null && Constant.token != " "
            ? const LayoutView()
            : const SignUpView();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SvgPicture.asset(
            Assets.imageLogo,
            height: size.height * .1,
            width: size.width * .1,
          ),
        ),
      ],
    );
  }
}
