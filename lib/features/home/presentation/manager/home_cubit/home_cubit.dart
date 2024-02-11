import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/function/Api.dart';
import 'package:e_commerce_app/core/models/Product_model.dart';
import 'package:e_commerce_app/core/models/category_model.dart';
import 'package:e_commerce_app/core/utils/Constant.dart';
import 'package:e_commerce_app/features/home/presentation/model/Banner_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<BannerModel> bannerList = [];
  void getBannerData() async {
    emit(HomegetBannerLoading());
    try {
      //  = 'https://student.valuxapps.com/api/banners';
      String baseUrl = Api.getUrl(endPoint: 'banners');
      http.Response response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] = true) {
          for (var item in responseData['data']) {
            bannerList.add(BannerModel.fromJson(item));
            emit(HomegetBannerSucess());
          }
        } else {
          emit(HomegetBannerFailed(errorMassage: responseData['message']));
        }
      }
    } catch (e) {
      emit(HomegetBannerFailed(errorMassage: e.toString()));
    }
  }

  List<CategoryModel> categoryList = [];
  void getCategory() async {
    emit(HomegetCategoryLoading());
    try {
      //  = 'https://student.valuxapps.com/api/banners';
      String baseUrl = Api.getUrl(endPoint: 'categories');
      http.Response response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] = true) {
          for (var item in responseData['data']['data']) {
            categoryList.add(CategoryModel.fromJson(item));
            emit(HomegetCategorySucess());
          }
        } else {
          emit(HomegetCategoryFailed(errorMassage: responseData['message']));
        }
      }
    } catch (e) {
      emit(HomegetCategoryFailed(errorMassage: e.toString()));
    }
  }

  List<ProductModel> productList = [];
  void getProduct() async {
    emit(HomegetProductLoading());
    try {
      //  = 'https://student.valuxapps.com/api/banners';
      String baseUrl = "https://student.valuxapps.com/api/home";
      http.Response response = await http.get(Uri.parse(baseUrl),
          headers: {'lang': 'en', 'Authorization': Constant.token!});

      var responseData = jsonDecode(response.body);
      if (responseData['status'] = true) {
        for (var item in responseData['data']['products']) {
          productList.add(ProductModel.fromJson(data: item));

          emit(HomegetProductSucess());
        }
      } else {
        emit(HomegetProductFailed(errorMassage: responseData['message']));
      }
    } catch (e) {
      emit(HomegetProductFailed(errorMassage: e.toString()));
    }
  }

  List<ProductModel> fliterProduct = [];
  void felterProduct({required String input}) {
    fliterProduct = productList
        .where((element) =>
            element.name!.toLowerCase().startsWith(input.toLowerCase()))
        .toList();
    emit(HomeFilterProductSucess());
  }
}
