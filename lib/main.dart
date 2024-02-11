import 'package:e_commerce_app/core/utils/Constant.dart';
import 'package:e_commerce_app/features/SignUp/presentaton/manager/Sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app/features/Splash/presentation/view/Splash_view.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/layout/presentation/manager/Layout/layout_cubit.dart';
import 'package:e_commerce_app/features/login/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const EcommerceApp());
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  Constant.token = sharedPreferences.getString('token');
  print("token is ${Constant.token}");
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()
            ..getBannerData()
            ..getProduct()
            ..getCategory(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
