import 'package:e_commerce_app/features/layout/presentation/manager/Layout/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);

        return Scaffold(
          bottomNavigationBar: NavigationBar(
            destinations: cubit.item,
            selectedIndex: cubit.currentIndex,
            onDestinationSelected: (value) {
              cubit.getBottomNavgation(value);
            },
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
