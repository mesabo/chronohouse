import 'resultat_model.dart';

class ResultUsers {
  Resultat? resultat;
  List<Users>? users;

  ResultUsers({this.resultat, this.users});

  ResultUsers.fromJson(Map<String, dynamic> json) {
    resultat =
        json['resultat'] != null ? Resultat?.fromJson(json['resultat']) : null;
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users?.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (resultat != null) {
      data['resultat'] = resultat?.toJson();
    }
    if (users != null) {
      data['users'] = users?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? nom;
  String? prenom;
  String? telephone;
  String? email;
  String? password;
  int? status;
  String? cat;
  String? uat;

  Users(
      {this.id,
      this.nom,
      this.prenom,
      this.telephone,
      this.email,
      this.password,
      this.status,
      this.cat,
      this.uat});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    telephone = json['telephone'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    cat = json['cat'];
    uat = json['uat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nom'] = nom;
    data['prenom'] = prenom;
    data['telephone'] = telephone;
    data['email'] = email;
    data['password'] = password;
    data['status'] = status;
    data['cat'] = cat;
    data['uat'] = uat;
    return data;
  }
}
