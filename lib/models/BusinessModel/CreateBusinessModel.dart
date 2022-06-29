class CreateBusinessModel {
  DataBusiness? dataBusiness;
  String? status;
  String? message;


  CreateBusinessModel({this.dataBusiness, this.status, this.message});

  CreateBusinessModel.fromJson(Map<String, dynamic> json) {
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
  String? propertyName;
  String? propertyType;
  String? brief;
  String? logo;
  String? owner_id;

  DataBusiness(
      {this.propertyName,
        this.propertyType,
        this.brief,
        this.logo,
        this.owner_id});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    propertyName = json['property_name'];
    propertyType = json['property_type'];
    brief = json['description'];
    logo = json['logo'];
    owner_id = json['owner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_name'] = this.propertyName;
    data['property_type'] = this.propertyType;
    data['brief'] = this.brief;
    data['owner_id'] = this.owner_id;
    data['logo'] = this.logo;
    return data;
  }
}
