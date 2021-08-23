import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travail/app/constants.dart';
import 'package:travail/model/model_sign_in.dart';
import 'package:travail/model/model_sign_up.dart';

class Source {
  static Source _instace;

  static Source get getInstance {
    return _instace == null ? _instace = Source() : _instace;
  }

  Future<String> saveSingUp({ModelSignUp modelSingIn}) async {
    print("------------------------>   ${modelSingIn.toJson()}");
    try {
      final response =
          await http.post("${linkUri}sign_up.php", body: modelSingIn.toJson());
      var resultat = await jsonDecode(response.body);
      print(resultat[0]['succes']);
      return resultat[0]['succes'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<String> saveSigIn({ModelSignIn modelSingIn}) async {
    print("------------------------>   ${modelSingIn.toJson()}");
    try {
      final response =
          await http.post("${linkUri}sign_in.php", body: modelSingIn.toJson());
      var resultat = await jsonDecode(response.body);
      print(resultat[0]['succes']);
      return resultat[0]['succes'];
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
