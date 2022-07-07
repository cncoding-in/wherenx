class MenuDetailsModel {
  DataBusiness? dataBusiness;
  String? status;
  String? message;

  MenuDetailsModel({this.dataBusiness, this.status, this.message});

  MenuDetailsModel.fromJson(Map<String, dynamic> json) {
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
  int? businessId;
  String? businessName;
  String? businessType;
  String? logo;
  String? status;
  String? address;
  String? description;

  DataBusiness(
      {this.businessId,
        this.businessName,
        this.businessType,
        this.logo,
        this.status,
        this.address,
        this.description});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    businessId = json['business_id'];
    businessName = json['business_name'];
    businessType = json['business_type'];
    logo = json['logo'];
    status = json['status'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['business_id'] = this.businessId;
    data['business_name'] = this.businessName;
    data['business_type'] = this.businessType;
    data['logo'] = this.logo;
    data['status'] = this.status;
    data['address'] = this.address;
    data['description'] = this.description;
    return data;
  }
}
