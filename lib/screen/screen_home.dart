import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travail/app/constantes_screen.dart';

class ScreenHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BodyState();
  }
}

class _BodyState extends State<ScreenHome> {
  String genre;
  bool status = false;
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
                color: Colors.blue,
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
          child: Column(children: [
            CustomTextField(
              // controler: _pu,
              title: "Nom",
              hintText: "Entrer votre nom",
              textInputType: TextInputType.number,
              readOnly: false,
              onPressed: () {
                setState(() {});
              },
            ),
            CustomTextField(
              // controler: _pu,
              title: "Postnom",
              hintText: "Entrer votre postnom",
              textInputType: TextInputType.number,
              readOnly: false,
              onPressed: () {
                setState(() {});
              },
            ),
            CustomTextField(
              // controler: _pu,
              title: "Prenom",
              hintText: "Entrer votre prenom",
              textInputType: TextInputType.number,
              readOnly: false,
              onPressed: () {
                setState(() {});
              },
            ),
            CustomTextField(
              // controler: _pu,
              title: "Contact",
              hintText: "Entrer votre contact",
              textInputType: TextInputType.number,
              readOnly: false,
              onPressed: () {
                setState(() {});
              },
            ),
            CustomTextField(
              // controler: _pu,
              title: "mail",
              hintText: "Entrer votre mail",
              textInputType: TextInputType.number,
              readOnly: false,
              onPressed: () {
                setState(() {});
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: FlatButton(
                color: Colors.blue.shade400,
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
                  setState(() {});
                },
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
