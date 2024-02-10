import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.icon,
      this.controller,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.fillcolor,
      this.icon2,
      this.obsecure});
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Color? fillcolor;
  final IconData? icon2;
  final bool? obsecure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obsecure ?? false,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIconColor: Colors.grey,
          fillColor: const Color(0xffEFE4F1),
          // suffixIcon: Icon(icon),
          filled: true,
          // fillColor: Colors.white,
          prefixIcon: Icon(icon2),
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          border: outineMethod(),
          enabledBorder: outineMethod(),
          focusedBorder: outineMethod()),
    );
  }

  OutlineInputBorder outineMethod() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white));
  }
}
