class Resultat {
  bool? status;
  String? message;
  bool? exists;
  String? detail;

  Resultat({this.status, this.message, this.exists, this.detail});

  Resultat.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    exists = json['exists'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['exists'] = exists;
    data['detail'] = detail;
    return data;
  }
}
