import 'package:e_commerce_app/features/SignUp/presentaton/manager/Sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app/features/Splash/presentation/view/Splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
