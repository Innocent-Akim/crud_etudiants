part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {}

class SignInIsEmpty extends SignInState {}

class SignInPregress extends SignInState {}

class SignInSucces extends SignInState {
  final message;

  SignInSucces(this.message);
}

class SignInLoadeng extends SignInState {}

class SignInFailded extends SignInState {}

class SignInConneced extends SignInState {}
