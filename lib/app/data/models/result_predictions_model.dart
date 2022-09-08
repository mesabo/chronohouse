import 'resultat_model.dart';

class ResultPredictions {
  Resultat? resultat;
  List<Predictions>? predictions;

  ResultPredictions({this.resultat, this.predictions});

  ResultPredictions.fromJson(Map<String, dynamic> json) {
    resultat =
        json['resultat'] != null ? Resultat?.fromJson(json['resultat']) : null;
    if (json['predictions'] != null) {
      predictions = <Predictions>[];
      json['predictions'].forEach((v) {
        predictions?.add(Predictions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (resultat != null) {
      data['resultat'] = resultat?.toJson();
    }
    if (predictions != null) {
      data['predictions'] = predictions?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Predictions {
  int? id;
  int? userId;
  double? income;
  double? age;
  double? rooms;
  double? bedrooms;
  double? population;
  String? address;
  double? price;
  String? cat;
  String? uat;

  Predictions(
      {this.id,
      this.userId,
      this.income,
      this.age,
      this.rooms,
      this.bedrooms,
      this.population,
      this.address,
      this.price,
      this.cat,
      this.uat});

  Predictions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    income = json['income'];
    age = json['age'];
    rooms = json['rooms'];
    bedrooms = json['bedrooms'];
    population = json['population'];
    address = json['address'];
    price = json['price'];
    cat = json['cat'];
    uat = json['uat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['income'] = income;
    data['age'] = age;
    data['rooms'] = rooms;
    data['bedrooms'] = bedrooms;
    data['population'] = population;
    data['address'] = address;
    data['price'] = price;
    data['cat'] = cat;
    data['uat'] = uat;
    return data;
  }
}
