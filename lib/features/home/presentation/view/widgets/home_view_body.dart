import 'package:e_commerce_app/core/function/Responsive_text.dart';
import 'package:e_commerce_app/core/models/Product_model.dart';
import 'package:e_commerce_app/core/widgets/CustomSizedBox.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';

import 'package:e_commerce_app/core/widgets/CustomTextField.dart';
import 'package:e_commerce_app/core/widgets/Custom_loading_simple.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_AppBar_home.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_grid_view_product_item.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_item_product.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_item_title.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/Custom_list_view_categories_item.dart';
import 'package:e_commerce_app/features/home/presentation/view/widgets/PageViewBanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      var cubit = HomeCubit.get(context);
      return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomSizeBox(
                        h: .04,
                      ),
                      CustomAppBarHome(size: size),
                      const CustomSizeBox(
                        h: .02,
                      ),
                      CustomTextField(
                        hintText: 'Search',
                        onChanged: (input) {
                          cubit.felterProduct(input: input);
                        },
                        icon2: Icons.search,
                        icon: Icons.clear,
                      ),
                      const CustomSizeBox(
                        h: .01,
                      ),
                      cubit.bannerList.isEmpty
                          ? const CustomloadingSimple()
                          : PageViewBanner(size: size, cubit: cubit),
                      const CustomSizeBox(
                        h: .01,
                      ),
                      const CustomItemtTitle(title: 'Categories'),
                      const CustomSizeBox(
                        h: .01,
                      ),
                      cubit.categoryList.isEmpty
                          ? const CustomloadingSimple()
                          : SizedBox(
                              height: size.height * .08,
                              child:
                                  CustomListViewCategoriesItem(cubit: cubit)),
                      const CustomSizeBox(
                        h: .01,
                      ),
                      const CustomItemtTitle(title: 'Product'),
                    ])),
          ),
          cubit.productList.isEmpty
              ? const SliverToBoxAdapter(
                  child: CustomloadingSimple(),
                )
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemCount: cubit.fliterProduct.isEmpty
                          ? cubit.productList.length
                          : cubit.fliterProduct.length,
                      itemBuilder: (context, index) => CustomItemProduct(
                            product: cubit.fliterProduct.isEmpty
                                ? cubit.productList[index]
                                : cubit.fliterProduct[index],
                            size: size,
                          )),
                )
        ],
      );
    });
  }
}
