import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travail/app/constantes_screen.dart';
import 'package:travail/bloc/sign_in_bloc.dart';
import 'package:travail/bloc/sing_up_bloc.dart';
import 'package:travail/model/model_sign_in.dart';

class ScreenData extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScreenData();
  }
}

class _ScreenData extends State<ScreenData> {
  var initUser;

  ScrollController scrollController = ScrollController();
  final search = TextEditingController();
  @override
  void initState() {
    super.initState();
    initUser = BlocProvider.of<SignInBloc>(context);
    initUser.add(SignInFindAll());
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Colors.transparent,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextField(
                controler: search,
                title: "Rechercher",
                hintText: "Cizungu Innocent",
                textInputType: TextInputType.text,
                readOnly: false,
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Divider(
                  color: Colors.deepOrange[100],
                ),
              ),
              Expanded(
                child: BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInInitial) {
                      return Center(
                        child: SpinKitCircle(
                          color: Colors.deepOrange,
                        ),
                      );
                    }
                    if (state is SignInIsEmpty) {
                      return Center(
                          child: Text(
                        "data",
                        style: GoogleFonts.roboto(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ));
                    }
                    if (state is SignInLoading && initUser.desplay.isEmpty) {
                      return Center(
                        child: SpinKitCircle(
                          color: Colors.deepOrange,
                        ),
                      );
                    } else {
                      return GridView.builder(
                          itemCount: initUser.desplay.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      (orientation == Orientation.portrait)
                                          ? 2
                                          : 3),
                          itemBuilder: (context, index) {
                            final data = initUser.desplay[index];
                            return CardUser(
                              nom: data.nom,
                              postnom: data.postnom,
                              adress: data.adresse,
                              genre: data.genre,
                              mail: data.mail,
                              prenom: data.prenom,
                            );
                          });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardUser extends StatelessWidget {
  final nom;
  final postnom;
  final prenom;
  final adress;
  final genre;
  final Function onPressed;
  final mail;

  const CardUser(
      {Key key,
      this.nom,
      this.postnom,
      this.prenom,
      this.adress,
      this.onPressed,
      this.mail,
      this.genre})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 3.0, right: 3.0, top: 3.0, bottom: 3.0),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[100], width: 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onPressed,
              child: Container(
                height: 50,
                width: 50,
                child: Icon(
                  genre == 'Homme' ? Icons.person_add_outlined : Icons.female,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: genre == 'Homme' ? Colors.deepOrange : Colors.blue,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Text(
              "${nom.toString().toUpperCase()}",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: GoogleFonts.dmSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            Text(
              "${postnom.toString().toUpperCase()}",
              style: GoogleFonts.dmSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              "${prenom}",
              style: GoogleFonts.dmSans(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              "${adress}",
              style: GoogleFonts.dmSans(
                color: Colors.teal,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              "${genre}",
              style: GoogleFonts.dmSans(
                color: Colors.red,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
