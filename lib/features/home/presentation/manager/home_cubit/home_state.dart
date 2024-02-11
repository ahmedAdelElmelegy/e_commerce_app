part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomegetBannerLoading extends HomeState {}

final class HomegetBannerFailed extends HomeState {
  final String errorMassage;

  HomegetBannerFailed({required this.errorMassage});
}

final class HomegetBannerSucess extends HomeState {}

final class HomegetCategoryLoading extends HomeState {}

final class HomegetCategoryFailed extends HomeState {
  final String errorMassage;

  HomegetCategoryFailed({required this.errorMassage});
}

final class HomegetCategorySucess extends HomeState {}

final class HomegetProductLoading extends HomeState {}

final class HomegetProductFailed extends HomeState {
  final String errorMassage;

  HomegetProductFailed({required this.errorMassage});
}

final class HomegetProductSucess extends HomeState {}

final class HomeFilterProductSucess extends HomeState {}
