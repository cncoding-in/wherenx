class MenuLocationModel {
  DataBusiness? dataBusiness;
  String? status;
  String? message;

  MenuLocationModel({this.dataBusiness, this.status, this.message});

  MenuLocationModel.fromJson(Map<String, dynamic> json) {
    dataBusiness = json['data_business'] != null
        ? new DataBusiness.fromJson(json['data_business'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dataBusiness != null) {
      data['data_business'] = this.dataBusiness!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class DataBusiness {
  String? latitude;
  String? longitude;

  DataBusiness({this.latitude, this.longitude});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
