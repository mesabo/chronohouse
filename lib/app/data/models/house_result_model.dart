class HouseResult {
  bool? status;
  String? message;
  double? result;
  House? house;

  HouseResult({this.status, this.message, this.result, this.house});

  HouseResult.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'];
    house = json['house'] != null ? House?.fromJson(json['house']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['result'] = result;
    if (house != null) {
      data['house'] = house?.toJson();
    }
    return data;
  }
}

class House {
  double? avgAreaIncome;
  double? avgAreaHouseAge;
  double? avgAreaNumberofRooms;
  double? avgAreaNumberofBedrooms;
  double? areaPopulation;
  double? price;

  House(
      {this.avgAreaIncome,
      this.avgAreaHouseAge,
      this.avgAreaNumberofRooms,
      this.avgAreaNumberofBedrooms,
      this.areaPopulation,
      this.price});

  House.fromJson(Map<String, dynamic> json) {
    avgAreaIncome = json['AvgAreaIncome'];
    avgAreaHouseAge = json['AvgAreaHouseAge'];
    avgAreaNumberofRooms = json['AvgAreaNumberofRooms'];
    avgAreaNumberofBedrooms = json['AvgAreaNumberofBedrooms'];
    areaPopulation = json['AreaPopulation'];
    price = json['Price'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['AvgAreaIncome'] = avgAreaIncome;
    data['AvgAreaHouseAge'] = avgAreaHouseAge;
    data['AvgAreaNumberofRooms'] = avgAreaNumberofRooms;
    data['AvgAreaNumberofBedrooms'] = avgAreaNumberofBedrooms;
    data['AreaPopulation'] = areaPopulation;
    data['Price'] = price;
    return data;
  }
}
