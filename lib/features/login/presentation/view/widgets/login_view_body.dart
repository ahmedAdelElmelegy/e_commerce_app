import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/utils/Constant.dart';
import 'package:e_commerce_app/core/widgets/CustomButtomNav.dart';
import 'package:e_commerce_app/core/widgets/CustomButton.dart';
import 'package:e_commerce_app/core/widgets/CustomSizedBox.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:e_commerce_app/core/widgets/CustomTextField.dart';
import 'package:e_commerce_app/features/SignUp/presentaton/view/Sign_up.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_view.dart';
import 'package:e_commerce_app/features/login/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  var emailController = TextEditingController();
  var passwoedController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSucess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomeView();
          }));
        } else if (state is LoginFailed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const CustomText(text: 'Erorr Massage'),
              content: CustomText(text: state.erorrMassage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'))
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizeBox(
                    h: .15,
                  ),
                  Center(
                    child: CustomText(
                      text: 'Login',
                      fontSize: RespText.getResponsiveFontSize(context, 30),
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const CustomSizeBox(
                    h: .1,
                  ),
                  CustomText(
                    text: 'Welcome Back',
                    fontSize: RespText.getResponsiveFontSize(context, 20),
                    fontWeight: FontWeight.w900,
                    color: Colors.grey,
                  ),
                  const CustomSizeBox(
                    h: .1,
                  ),
                  CustomTextField(
                    hintText: 'Email',
                    controller: emailController,
                    icon2: Icons.email,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the email is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .02,
                  ),
                  CustomTextField(
                    hintText: 'Password',
                    controller: passwoedController,
                    icon2: Icons.key,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the password is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .05,
                  ),
                  CustomButton(
                    text: state is LoginLoading ? 'Loading....' : 'Login',
                    color: Constant.defaultColor,
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.login(
                            email: emailController.text,
                            password: passwoedController.text);
                      }
                    },
                  ),
                  CustomButtomNav(
                    text1: 'Sign Up',
                    text2: 'Don\'t  have an account ? ',
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const SignUpView();
                        },
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
