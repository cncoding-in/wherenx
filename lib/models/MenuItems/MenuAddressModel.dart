class MenuAddressModel {
  DataBusiness? dataBusiness;
  String? status;
  String? message;

  MenuAddressModel({this.dataBusiness, this.status, this.message});

  MenuAddressModel.fromJson(Map<String, dynamic> json) {
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
  String? state;
  String? city;
  String? country;
  String? address;
  String? pincode;

  DataBusiness(
      {this.state, this.city, this.country, this.address, this.pincode});

  DataBusiness.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    pincode = json['pincode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['city'] = this.city;
    data['country'] = this.country;
    data['address'] = this.address;
    data['pincode'] = this.pincode;
    return data;
  }
}
