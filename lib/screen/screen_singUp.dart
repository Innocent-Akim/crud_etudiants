import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travail/app/constantes_screen.dart';
import 'package:travail/app/constants.dart';
import 'package:travail/bloc/sing_up_bloc.dart';
import 'package:travail/model/model_sign_up.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<ScreenHome> {
  String genre;
  bool status = false;
  var initBloc;
  var nom = TextEditingController();
  var postnom = TextEditingController();
  var prenom = TextEditingController();
  var contact = TextEditingController();
  var mail = TextEditingController();

  @override
  void initState() {
    super.initState();
    initBloc = BlocProvider.of<SingUpBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0.0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                setState(() {});
              },
            ),
            Expanded(
              child: Text(
                "USER NAME",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: BlocListener<SingUpBloc, SingUpState>(
            listener: (context, state) {
              if (state is SingUpProgress) {
                setState(() {
                  FocusScope.of(context).requestFocus(FocusNode());
                  status = true;
                });
              }
              if (state is SingUpSucces) {
                setState(() {
                  showTop(
                    context: context,
                    title: state.message,
                    color: Colors.teal,
                    icon: Icon(
                      FontAwesomeIcons.save,
                      color: Colors.white,
                    ),
                  );
                  status = false;
                  nom.clear();
                  postnom.clear();
                  prenom.clear();
                  contact.clear();
                  mail.clear();
                });
              }
              if (state is SingUpIsEmpty) {}
            },
            child: BlocBuilder<SingUpBloc, SingUpState>(
              builder: (context, state) {
                return Column(children: [
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
                    controler: contact,
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
                    title: "mail",
                    hintText: "Entrer votre mail",
                    textInputType: TextInputType.emailAddress,
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
                          ModelSignUp modelSignUp = ModelSignUp(
                            nom: nom.text,
                            postnom: postnom.text,
                            prenom: prenom.text,
                            contact: contact.text,
                            mail: mail.text,
                            code: '0',
                          );
                          print(modelSignUp.toJson());
                          initBloc
                              .add(SingUpSendData(modelSignup: modelSignUp));
                        });
                      },
                    ),
                  ),
                ]);
              },
            ),
          ),
        ),
      ),
    ));
  }
}
