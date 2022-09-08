import 'resultat_model.dart';

class ResultDashboards {
  Resultat? resultat;
  List<Dashboards>? dashboards;

  ResultDashboards({this.resultat, this.dashboards});

  ResultDashboards.fromJson(Map<String, dynamic> json) {
    resultat =
        json['resultat'] != null ? Resultat?.fromJson(json['resultat']) : null;
    if (json['dashboards'] != null) {
      dashboards = <Dashboards>[];
      json['dashboards'].forEach((v) {
        dashboards?.add(Dashboards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (resultat != null) {
      data['resultat'] = resultat?.toJson();
    }
    if (dashboards != null) {
      data['dashboards'] = dashboards?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dashboards {
  int? id;
  int? userId;
  int? total;
  int? today;
  int? newsdata;
  double? score;
  String? cat;
  String? uat;

  Dashboards(
      {this.id,
      this.userId,
      this.total,
      this.today,
      this.newsdata,
      this.score,
      this.cat,
      this.uat});

  Dashboards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    total = json['total'];
    today = json['today'];
    newsdata = json['newsdata'];
    score = json['score'];
    cat = json['cat'];
    uat = json['uat'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total'] = total;
    data['today'] = today;
    data['newsdata'] = newsdata;
    data['score'] = score;
    data['cat'] = cat;
    data['uat'] = uat;
    return data;
  }
}
