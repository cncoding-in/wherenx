class BusinessStatusmodel {
  BusinessData? businessData;
  String? status;
  String? message;

  BusinessStatusmodel({this.businessData, this.status, this.message});

  BusinessStatusmodel.fromJson(Map<String, dynamic> json) {
    businessData = json['business_data'] != null
        ? new BusinessData.fromJson(json['business_data'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.businessData != null) {
      data['business_data'] = this.businessData!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class BusinessData {
  bool? details;
  bool? location;
  bool? address;
  bool? coupon;
  bool? media;
  bool? hours;
  bool? offer;

  BusinessData(
      {this.details,
        this.location,
        this.address,
        this.coupon,
        this.media,
        this.hours,
        this.offer});

  BusinessData.fromJson(Map<String, dynamic> json) {
    details = json['details'];
    location = json['location'];
    address = json['address'];
    coupon = json['coupon'];
    media = json['media'];
    hours = json['hours'];
    offer = json['offer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['details'] = this.details;
    data['location'] = this.location;
    data['address'] = this.address;
    data['coupon'] = this.coupon;
    data['media'] = this.media;
    data['hours'] = this.hours;
    data['offer'] = this.offer;
    return data;
  }
}
