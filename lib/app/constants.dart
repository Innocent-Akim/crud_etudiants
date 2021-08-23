import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const linkUri = "http://192.168.157.90/api/home/";
const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Color(0xFF212332);

const defaultPadding = 16.0;

void showTop({BuildContext context, Icon icon, title, Color color}) => Flushbar(
      icon: icon,
      shouldIconPulse: false,
      duration: Duration(seconds: 3),
      // message: title,
      messageText: Text(
        title,
        style: GoogleFonts.roboto(color: Colors.white, fontSize: 15),
      ),
      // borderColor: Colors.white,
      // borderRadius: 20,
      // borderWidth: 20,
      flushbarStyle: FlushbarStyle.GROUNDED,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      backgroundColor: color,
      flushbarPosition: FlushbarPosition.BOTTOM,
      animationDuration: Duration(seconds: 2),
    )..show(context);
