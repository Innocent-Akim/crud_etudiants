import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final hintText;
  final VoidCallback onPressed;
  final controler;
  final margeText;
  final textInputType;
  final readOnly;
  final title;
  final focusrequest;
  final isobscure;
  final child;

  const CustomTextField({
    Key key,
    this.hintText,
    this.onPressed,
    this.controler,
    this.margeText,
    this.textInputType,
    this.readOnly = false,
    this.title,
    this.focusrequest,
    this.isobscure = false,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: Colors.grey[100],
          border: Border.all(
            color: Colors.blue[100],
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.dmSans(color: Colors.black),
              ),
              child == null
                  ? TextFormField(
                      obscureText: isobscure,
                      focusNode: focusrequest,
                      readOnly: readOnly,
                      keyboardType: textInputType,
                      maxLines: !isobscure ? margeText : 1,
                      controller: controler,
                      onChanged: (value) {},
                      style: GoogleFonts.dmSans(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                      ),
                      onTap: onPressed,
                    )
                  : child,
            ],
          ),
        ),
      ),
    );
  }
}

Widget cbList(
        {List<DropdownMenuItem<String>> list,
        title,
        String valeur,
        Function onChanged}) =>
    DropdownButtonFormField(
      isExpanded: true,
      items: list,
      value: valeur,
      onChanged: onChanged,
      hint: Text(
        "Sélectionnez ${title}",
        style: GoogleFonts.roboto(
          fontSize: 12,
        ),
      ),
      decoration: InputDecoration(
        //labelText: "Technologies",
        border: InputBorder.none,
        hintStyle: GoogleFonts.roboto(
            fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
        contentPadding: EdgeInsets.fromLTRB(5, 10, 5, 10),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (val) => val == null ? "Ce champs est obligatoire" : null,
      onSaved: (val) => valeur = val,
    );

List<DropdownMenuItem<String>> isList({List<String> value}) {
  return value
      .map(
        (value) => DropdownMenuItem(
          value: value,
          child: value == null || value.isEmpty
              ? Text("")
              : Row(
                  children: [
                    Container(
                      height: 16,
                      width: 16,
                      child: Center(
                        child: Text(
                          value.substring(0, 1).toUpperCase(),
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    SizedBox(width: 3),
                    Text(
                      value,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
        ),
      )
      .toList();
}
