import 'package:card_swiper/card_swiper.dart';
import 'package:e_commerce_app/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageViewBanner extends StatelessWidget {
  const PageViewBanner({
    super.key,
    required this.size,
    required this.cubit,
  });

  final Size size;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * .20,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Swiper(
          itemCount: cubit.bannerList.length,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.network(
              cubit.bannerList[index].image!,
              fit: BoxFit.fill,
            );
          },
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
