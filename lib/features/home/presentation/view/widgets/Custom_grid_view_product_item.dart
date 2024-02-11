import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_item_product.dart';
import 'package:flutter/material.dart';

class CustomGridViewProductItem extends StatelessWidget {
  const CustomGridViewProductItem({
    super.key,
    required this.cubit,
    required this.size,
  });

  final HomeCubit cubit;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 20, crossAxisSpacing: 20),
        itemCount: cubit.productList.length,
        itemBuilder: (context, index) =>
            CustomItemProduct(size: size, product: cubit.productList[index]),
      ),
    );
  }
}
