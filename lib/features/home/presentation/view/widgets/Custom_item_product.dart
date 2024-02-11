import 'package:e_commerce_app/core/models/Product_model.dart';
import 'package:e_commerce_app/core/widgets/CustomText.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class CustomItemProduct extends StatelessWidget {
  const CustomItemProduct(
      {super.key, required this.size, required this.product});
  final Size size;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FancyShimmerImage(
            imageUrl: product.image!,
            height: size.height * .15,
          ),
        ),
        CustomText(
          text: product.name.toString(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomText(text: "${product.price}\$"),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: " ${product.oldPrice}\$ ",
                    decoration: TextDecoration.lineThrough,
                  ),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
          ],
        )
      ],
    );
  }
}
