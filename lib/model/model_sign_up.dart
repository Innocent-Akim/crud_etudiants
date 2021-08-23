import 'dart:convert';

class ModelSignUp {
  String code;
  String nom;
  String postnom;
  String prenom;
  String contact;
  String mail;
  ModelSignUp({
    this.code,
    this.nom,
    this.postnom,
    this.prenom,
    this.contact,
    this.mail,
  });

  ModelSignUp copyWith({
    String code,
    String nom,
    String postnom,
    String prenom,
    String contact,
    String mail,
  }) {
    return ModelSignUp(
      code: code ?? this.code,
      nom: nom ?? this.nom,
      postnom: postnom ?? this.postnom,
      prenom: prenom ?? this.prenom,
      contact: contact ?? this.contact,
      mail: mail ?? this.mail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'contact': contact,
      'mail': mail,
    };
  }

  factory ModelSignUp.fromMap(Map<String, dynamic> map) {
    return ModelSignUp(
      code: map['code'],
      nom: map['nom'],
      postnom: map['postnom'],
      prenom: map['prenom'],
      contact: map['contact'],
      mail: map['mail'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelSignUp.fromJson(String source) =>
      ModelSignUp.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModelSignUp(code: $code, nom: $nom, postnom: $postnom, prenom: $prenom, contact: $contact, mail: $mail)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModelSignUp &&
        other.code == code &&
        other.nom == nom &&
        other.postnom == postnom &&
        other.prenom == prenom &&
        other.contact == contact &&
        other.mail == mail;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        nom.hashCode ^
        postnom.hashCode ^
        prenom.hashCode ^
        contact.hashCode ^
        mail.hashCode;
  }
}
