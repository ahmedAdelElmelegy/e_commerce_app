import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomloadingSimple extends StatelessWidget {
  const CustomloadingSimple({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
