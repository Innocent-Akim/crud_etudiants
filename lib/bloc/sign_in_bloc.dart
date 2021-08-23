import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travail/bloc/sing_up_bloc.dart';
import 'package:travail/model/model_sign_in.dart';
import 'package:travail/src/source.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial());
  List desplay = [];

  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    if (event is SignInSave) {
      yield SignInPregress();
      var resultat =
          await Source.getInstance.saveSigIn(modelSingIn: event.modelSignIn);
      if (resultat != null) {
        yield SignInSucces(resultat);
      }
    }
    if (event is SignInFindAll) {
      yield SignInInitial();
      var data = await Source.getInstance.findAll().whenComplete(() => null);
      yield SignInLoading();
      desplay = data;
      if (data != null) {
        yield SignInLoaded();
      } else {
        SignInIsEmpty();
      }
    }
    if (event is SignInLogin) {
      yield SignInLoadeng();
      var resultat = await Source.getInstance.findLogin(
        password: event.password,
        username: event.username,
      );
      if (resultat != null) {
        yield SignInConneced();
      } else {
        yield SignInFailded();
      }
    }
  }
}
