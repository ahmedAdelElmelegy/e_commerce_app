import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/widgets/CustomButton.dart';
import 'package:e_commerce_app/core/widgets/CustomSizedBox.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:e_commerce_app/core/widgets/CustomTextField.dart';
import 'package:e_commerce_app/features/SignUp/presentaton/manager/Sign_up/sign_up_cubit.dart';
import 'package:e_commerce_app/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailed) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const CustomText(text: 'Erorr Massage'),
              content: CustomText(text: state.errorMassage),
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
        if (state is SignUpSucess) {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return const LoginView();
            },
          ));
        }
      },
      builder: (context, state) {
        var cubit = SignUpCubit.get(context);

        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizeBox(
                    h: .2,
                  ),
                  CustomText(
                    text: 'Sign Up',
                    fontSize: RespText.getResponsiveFontSize(context, 25),
                    fontWeight: FontWeight.w900,
                  ),
                  const CustomSizeBox(
                    h: .06,
                  ),
                  CustomTextField(
                    hintText: 'Username',
                    controller: usernameController,
                    icon2: Icons.person,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the UserName is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .01,
                  ),
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    icon2: Icons.email,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the Email is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .01,
                  ),
                  CustomTextField(
                    controller: phoneController,
                    hintText: 'Phone',
                    icon2: Icons.call,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the Phone is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .01,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    icon2: Icons.key,
                    obsecure: true,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'the Password is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const CustomSizeBox(
                    h: .04,
                  ),
                  CustomButton(
                    text: state is SignUpLoading ? "Loading......" : 'Register',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.signUp(
                            username: usernameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                            password: passwordController.text);
                      }
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
