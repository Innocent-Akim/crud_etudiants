import 'dart:convert';

class ModelSignIn {
  String code;
  String nom;
  String postnom;
  String prenom;
  String genre;
  String adresse;
  String contact;
  String mail;
  String usename;
  String password;
  ModelSignIn({
    this.code,
    this.nom,
    this.postnom,
    this.prenom,
    this.genre,
    this.adresse,
    this.contact,
    this.mail,
    this.usename,
    this.password,
  });

  ModelSignIn copyWith({
    String code,
    String nom,
    String postnom,
    String prenom,
    String genre,
    String adresse,
    String contact,
    String mail,
    String usename,
    String password,
  }) {
    return ModelSignIn(
      code: code ?? this.code,
      nom: nom ?? this.nom,
      postnom: postnom ?? this.postnom,
      prenom: prenom ?? this.prenom,
      genre: genre ?? this.genre,
      adresse: adresse ?? this.adresse,
      contact: contact ?? this.contact,
      mail: mail ?? this.mail,
      usename: usename ?? this.usename,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'genre': genre,
      'adresse': adresse,
      'contact': contact,
      'mail': mail,
      'usename': usename,
      'password': password,
    };
  }

  factory ModelSignIn.fromMap(Map<String, dynamic> map) {
    return ModelSignIn(
      code: map['code'],
      nom: map['nom'],
      postnom: map['postnom'],
      prenom: map['prenom'],
      genre: map['genre'],
      adresse: map['adresse'],
      contact: map['contact'],
      mail: map['mail'],
      usename: map['usename'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelSignIn.fromJson(String source) =>
      ModelSignIn.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelSignIn(code: $code, nom: $nom, postnom: $postnom, prenom: $prenom, genre: $genre, adresse: $adresse, contact: $contact, mail: $mail, usename: $usename, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelSignIn &&
        other.code == code &&
        other.nom == nom &&
        other.postnom == postnom &&
        other.prenom == prenom &&
        other.genre == genre &&
        other.adresse == adresse &&
        other.contact == contact &&
        other.mail == mail &&
        other.usename == usename &&
        other.password == password;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        nom.hashCode ^
        postnom.hashCode ^
        prenom.hashCode ^
        genre.hashCode ^
        adresse.hashCode ^
        contact.hashCode ^
        mail.hashCode ^
        usename.hashCode ^
        password.hashCode;
  }
}
