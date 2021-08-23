part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInSave extends SignInEvent {
  final ModelSignIn modelSignIn;
  SignInSave({this.modelSignIn});
}

class SignInFindAll extends SignInEvent {}

class SignInLogin extends SignInEvent {
  final username;
  final password;
  SignInLogin({this.username, this.password});
}
