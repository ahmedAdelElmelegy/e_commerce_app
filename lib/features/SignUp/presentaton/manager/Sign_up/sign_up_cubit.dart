import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/models/Sign_in_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  void signUp(
      {required String username,
      required String email,
      required String phone,
      required String password}) async {
    emit(SignUpLoading());

    SignInModel signMode = SignInModel(
        username: username, email: email, phone: phone, password: password);
    String baseUrl = 'https://student.valuxapps.com/api/register';

    http.Response response = await http.post(Uri.parse(baseUrl),
        body: signMode.toMap(), headers: {'lang': 'en'});
    var responseData = jsonDecode(response.body);
    if (responseData['status'] == true) {
      emit(SignUpSucess());
    } else if (responseData['status'] == false) {
      emit(SignUpFailed(errorMassage: responseData['message']));
    }
  }
}
