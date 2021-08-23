import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travail/model/model_sign_up.dart';
import 'package:travail/src/source.dart';
part 'sing_up_event.dart';
part 'sing_up_state.dart';

class SingUpBloc extends Bloc<SingUpEvent, SingUpState> {
  SingUpBloc() : super(SingUpInitial());

  @override
  Stream<SingUpState> mapEventToState(
    SingUpEvent event,
  ) async* {
    if (event is SingUpSendData) {
      yield SingUpProgress();
      var resultat =
          await Source.getInstance.saveSingUp(modelSingIn: event.modelSignup);
      if (resultat != null) {
        yield SingUpSucces(resultat);
      }
    }
  }
}
