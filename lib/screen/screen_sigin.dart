import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:travail/app/constantes_screen.dart';
import 'package:travail/app/constants.dart';
import 'package:travail/bloc/sign_in_bloc.dart';
import 'package:travail/model/model_sign_in.dart';
import 'package:travail/screen/screen_data_signin.dart';

class ScreenUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<ScreenUp> {
  String genre;
  bool status = false;
  var initBloc;
  var nom = TextEditingController();
  var postnom = TextEditingController();
  var prenom = TextEditingController();

  var contact = TextEditingController();
  var adress = TextEditingController();
  var mail = TextEditingController();
  var username = TextEditingController();
  var password = TextEditingController();

  @override
  void initState() {
    super.initState();
    initBloc = BlocProvider.of<SignInBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                icon: Icon(
                  Icons.theater_comedy,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  setState(() {
                    AdaptiveTheme.of(context).setDark();
                  });
                }),
            Expanded(
              child: Text(
                "UTILISATEUR",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    isDismissible: false,
                    context: context,
                    builder: (context) {
                      return Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [ScreenData()],
                          ),
                        ),
                      );
                    });
              },
              icon: Icon(
                Icons.find_in_page_outlined,
                color: Colors.deepOrange,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state is SignInPregress) {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  status = true;
                });
              }
              if (state is SignInSucces) {
                setState(() {
                  showTop(
                    context: context,
                    title: state.message,
                    color: Colors.teal,
                    icon: Icon(
                      FontAwesomeIcons.replyAll,
                      color: Colors.white,
                    ),
                  );
                  status = false;
                  nom.clear();
                  postnom.clear();
                  prenom.clear();
                  genre = null;
                  adress.clear();
                  contact.clear();
                  password.clear();
                  username.clear();
                  mail.clear();
                });
              }
              if (state is SignInIsEmpty) {}
            },
            child: Column(children: [
              CustomTextField(
                controler: nom,
                title: "Nom",
                hintText: "Entrer votre nom",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: postnom,
                title: "Postnom",
                hintText: "Entrer votre postnom",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: prenom,
                title: "Prenom",
                hintText: "Entrer votre prenom",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                // controler: _pu,
                title: "Genre",
                hintText: "Entrer votre genre",
                textInputType: TextInputType.number,
                readOnly: false,
                child: cbList(
                    list: isList(value: ['Homme', 'Femme']),
                    onChanged: (val) {
                      setState(() {
                        genre = val;
                      });
                    },
                    title: "Genre",
                    valeur: genre),
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: adress,
                title: "Adresse",
                hintText: "Entrer votre adresse",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                // controler: _pu,
                title: "Contact",
                hintText: "Entrer votre contact",
                textInputType: TextInputType.phone,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: mail,
                title: "Mail",
                hintText: "Entrer votre mail",
                textInputType: TextInputType.emailAddress,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: username,
                title: "User name",
                hintText: "Entrer votre username",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              CustomTextField(
                controler: password,
                isobscure: true,
                title: "Password",
                hintText: "Entrer votre password",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {
                  setState(() {});
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: FlatButton(
                  color: Colors.deepOrange,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: !status
                          ? Text(
                              "Enregistrer",
                              style: GoogleFonts.dmSans(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : SpinKitCircle(
                              color: Colors.white,
                              size: 35,
                            ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      ModelSignIn signIn = ModelSignIn(
                        nom: nom.text,
                        postnom: postnom.text,
                        prenom: prenom.text,
                        contact: contact.text,
                        adresse: adress.text,
                        genre: genre,
                        mail: mail.text,
                        password: password.text,
                        usename: username.text,
                        code: "0",
                      );

                      initBloc.add(SignInSave(modelSignIn: signIn));
                    });
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
