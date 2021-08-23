part of 'sing_up_bloc.dart';

abstract class SingUpState extends Equatable {
  const SingUpState();

  @override
  List<Object> get props => [];
}

class SingUpInitial extends SingUpState {}

class SingUpLoading extends SingUpState {}

class SingUpLoaded extends SingUpState {
  final data;
  SingUpLoaded({this.data});
}

class SingUpFailed extends SingUpState {}

class SingUpIsEmpty extends SingUpState {}

class SingUpProgress extends SingUpState {}

class SingUpSucces extends SingUpState {
  final message;

  SingUpSucces(this.message);
}
