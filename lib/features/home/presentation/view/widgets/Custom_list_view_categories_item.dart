import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_item_categories.dart';
import 'package:flutter/material.dart';

class CustomListViewCategoriesItem extends StatelessWidget {
  const CustomListViewCategoriesItem({super.key, required this.cubit});
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: cubit.categoryList.length,
      itemBuilder: (context, index) =>
          CustomItemCategories(image: cubit.categoryList[index].image!),
    );
  }
}
