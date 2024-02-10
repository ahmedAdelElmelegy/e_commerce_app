import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/Cart/Presentation/view/Cart_view.dart';
import 'package:e_commerce_app/features/Categorize/presentation/view/Categorize_view.dart';
import 'package:e_commerce_app/features/Favorites/presentation/view/Favorites_view.dart';
import 'package:e_commerce_app/features/Profile/presentation/view/prorfile_view.dart';
import 'package:e_commerce_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:meta/meta.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    CategorizeView(),
    FavoritesView(),
    CartView(),
    ProfileView(),
  ];
  List<NavigationDestination> item = const [
    NavigationDestination(
        icon: Icon(IconlyLight.home),
        selectedIcon: Icon(IconlyBold.home),
        label: 'Home'),
    NavigationDestination(
        icon: Icon(IconlyLight.category),
        selectedIcon: Icon(IconlyBold.category),
        label: 'Category'),
    NavigationDestination(
        icon: Icon(IconlyLight.heart),
        selectedIcon: Icon(IconlyBold.heart),
        label: 'favorites'),
    NavigationDestination(
        icon: Icon(Icons.shopping_cart),
        selectedIcon: Icon(Icons.shopping_cart),
        label: 'Cart'),
    NavigationDestination(
        icon: Icon(IconlyLight.profile),
        selectedIcon: Icon(IconlyBold.profile),
        label: 'Profile'),
  ];
  void getBottomNavgation(int index) {
    currentIndex = index;
    emit(LayoutBottomNavgationSucess());
  }
}
