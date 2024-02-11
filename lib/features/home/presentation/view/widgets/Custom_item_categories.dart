import 'package:flutter/material.dart';

class CustomItemCategories extends StatelessWidget {
  const CustomItemCategories({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 35,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
