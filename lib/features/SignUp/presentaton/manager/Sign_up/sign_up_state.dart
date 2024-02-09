part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSucess extends SignUpState {}

final class SignUpFailed extends SignUpState {
  final String errorMassage;

  SignUpFailed({required this.errorMassage});
}
