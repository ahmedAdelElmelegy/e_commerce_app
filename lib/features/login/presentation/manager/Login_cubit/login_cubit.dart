import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  void login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      http.Response response = await http.post(
          Uri.parse('https://student.valuxapps.com/api/login'),
          body: {'email': email, 'password': password},
          headers: {'lang': 'en'});

      if (response.statusCode == 200) {
        var responseData = await jsonDecode(response.body);
        if (responseData['status'] == true) {
          emit(LoginSucess());
          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString('token', responseData['data']['token']);
        } else if (responseData['status'] == false) {
          emit(LoginFailed(erorrMassage: responseData['message']));
        }
      }
    } catch (e) {
      emit(LoginFailed(erorrMassage: e.toString()));
    }
  }
}
