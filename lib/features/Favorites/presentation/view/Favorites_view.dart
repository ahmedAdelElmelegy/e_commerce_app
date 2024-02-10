import 'package:e_commerce_app/features/Favorites/presentation/view/widgets/Favorites_view_body.dart';
import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesViewBody(),
    );
  }
}
