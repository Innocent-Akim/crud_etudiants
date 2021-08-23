import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travail/screen/screen_sigin.dart';
import 'package:travail/screen/screen_singUp.dart';

class ScreenLogin extends StatefulWidget {
  static final String rootName = "/LoginSevenPage";
  @override
  _ScreenLogin createState() => _ScreenLogin();
}

class _ScreenLogin extends State<ScreenLogin> {
  final _username = new TextEditingController();
  final _password = new TextEditingController();
  bool isLogin = false;
  final formLoginKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isvisible = true;
  var bloc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Center(
        child: loginBody(),
      ),
    );
  }

  loginBody() => SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          loginHeader(),
          Form(
            key: formLoginKey,
            child: loginFields(),
          ),
        ],
      ));

  loginHeader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildProfile(),
          SizedBox(
            height: 30.0,
          ),
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.deepOrange,
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _username,
                    onChanged: (String value) {},
                    cursorColor: Colors.deepOrange,
                    keyboardType: TextInputType.emailAddress,
                    style: GoogleFonts.roboto(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: "Entrez votre nom d'utilisateur",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.email,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.deepOrange,
                  width: 1,
                )),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _password,
                        obscureText: isvisible,
                        onChanged: (String value) {},
                        cursorColor: Colors.deepOrange,
                        style: GoogleFonts.roboto(fontSize: 13),
                        decoration: InputDecoration(
                          hintText: "Entrez votre mot de passe",
                          prefixIcon: Material(
                            elevation: 0,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            child: Icon(
                              Icons.lock,
                              color: Colors.black,
                              size: 20,
                            ),
                            textStyle: GoogleFonts.roboto(fontSize: 13),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 13),
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          isvisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          size: 15,
                        ),
                        onPressed: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        })
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(12.0),
                              shape: StadiumBorder(),
                              child: Text(
                                "SIGN IN",
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              color: Colors.blue.shade400,
                              onPressed: () {
                                setState(() {
                                  isLogin = true;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ScreenHome();
                                  }));
                                });
                              },
                            ))
                        // : Center(
                        //     child: SpinKitCircle(
                        //       color: Colors.blue.shade400,
                        //     ),
                        //   ),
                        ),
                  ),
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 0.0),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.all(12.0),
                              shape: StadiumBorder(),
                              child: Text(
                                "SIGN UP",
                                style: GoogleFonts.dmSans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              color: Colors.deepOrange,
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return ScreenUp();
                                  }));
                                  isLogin = true;
                                  _loginsucces();
                                });
                              },
                            ))
                        // : Center(
                        //     child: SpinKitCircle(
                        //       color: Colors.blue.shade400,
                        //     ),
                        //   ),
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
  void _loginsucces() {
    var data = [_username.text, _password.text];
    FocusScopeNode(canRequestFocus: false);
  }

  buildProfile() {
    return Container(
      width: 200,
      height: 200,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Container(
          // child: SvgPicture.asset("assets/sign.svg"),
          ),
    );
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(
      new SnackBar(
        backgroundColor: Colors.black,
        duration: Duration(seconds: 2),
        // animation: Animation[7,9],
        elevation: 2.0,
        content: Text(
          value,
          style: GoogleFonts.dmSans(
            color: Colors.teal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
