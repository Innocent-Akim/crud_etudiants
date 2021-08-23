part of 'sing_up_bloc.dart';

abstract class SingUpEvent extends Equatable {
  const SingUpEvent();

  @override
  List<Object> get props => [];
}

class SingUpSendData extends SingUpEvent {
  final ModelSignUp modelSignup;
  SingUpSendData({this.modelSignup});
}

class SingUpFind extends SingUpEvent {}

class SingUpUpdate extends SingUpEvent {
  final ModelSignUp modelSignup;
  SingUpUpdate(this.modelSignup);
}
